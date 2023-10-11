import { customRef } from "vue";

export function debounceRef(value: any, duration = 1000) {
    let timer: string | number | NodeJS.Timeout | undefined
    return customRef((track, trigger) => {
        return {
            get() {
                // 收集
                track()
                return value;
            },
            set(val) {
                clearTimeout(timer)
                timer = setTimeout(() => {
                    trigger()
                    value = val
                }, duration)
            }
        }
    })
}