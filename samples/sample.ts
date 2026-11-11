// Sample file for checking the theme. Not shipped in the extension.
import { readFile } from 'node:fs/promises'

interface Player {
  name: string
  number: number
  position: 'GK' | 'DF' | 'MF' | 'FW'
}

const MAX_SQUAD = 25

/** Loads a squad list from disk. */
export async function loadSquad(path: string): Promise<Player[]> {
  const raw = await readFile(path, 'utf8')
  const squad = JSON.parse(raw) as Player[]

  if (squad.length > MAX_SQUAD) {
    throw new Error(`Squad too big: ${squad.length} / ${MAX_SQUAD}`)
  }

  return squad.filter((p) => /^[A-Z]/.test(p.name))
}

class Team {
  constructor(private readonly players: Player[]) {}

  get forwards() {
    return this.players.filter((p) => p.position === 'FW')
  }
}

export default new Team([])
