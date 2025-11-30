import { LightningElement } from "lwc";

const DEFAULT_ITEMS = Object.freeze([
  { id: "1", label: "Alpha" },
  { id: "2", label: "Bravo" },
  { id: "3", label: "Charlie" },
  { id: "4", label: "Delta" },
  { id: "5", label: "Echo" }
]);

export default class SampleList extends LightningElement {
  items = [...DEFAULT_ITEMS];

  handleShuffle() {
    // Fisher-Yates shuffle on a cloned array
    const arr = [...this.items];
    for (let i = arr.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [arr[i], arr[j]] = [arr[j], arr[i]];
    }
    this.items = arr;
  }

  handleReset() {
    this.items = [...DEFAULT_ITEMS];
  }
}
