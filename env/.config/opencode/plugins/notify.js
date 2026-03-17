import { join } from "path"
import { platform } from "os"
import { spawn } from "child_process"

export const NotifyPlugin = async () => {
  const dir = import.meta.dir
  const idleSound = join(dir, "PeonReady1.ogg")
  const questionSound = join(dir, "PeonWhat3.ogg")
  let busySince = null

  const play = (file) => {
    if (platform() === "darwin") {
      const p = spawn("afplay", [file], {
        detached: true,
        stdio: "ignore",
      })
      p.unref()
    } else {
      const p = spawn("mpv", ["--no-video", "--really-quiet", file], {
        detached: true,
        stdio: "ignore",
      })
      p.unref()
    }
  }

  return {
    event: async ({ event }) => {
      // Track when the agent starts working
      if (event.type === "session.status") {
        if (busySince === null) {
          busySince = Date.now()
        }
      }

      if (event.type === "session.idle") {
        const elapsed = busySince ? Date.now() - busySince : 0
        busySince = null
        if (elapsed > 10_000) {
          play(idleSound)
        }
      }

      if (event.type === "permission.asked") {
       play(questionSound)
      }
    },
  }
}
