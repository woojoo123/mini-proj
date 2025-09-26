 const sections = [...document.querySelectorAll('.section[data-step]')];
        const btns = [...document.querySelectorAll('.step-btn')];
        const bar = document.getElementById('bar');
        let step = 1;

        function goto(n) {
            step = Math.min(Math.max(n, 1), sections.length);
            sections.forEach(s => s.classList.toggle('active', +s.dataset.step === step));
            btns.forEach((b, i) => {
                b.classList.toggle('active', i + 1 === step);
                b.classList.toggle('done', i + 1 < step);
            });
            bar.style.width = (step / sections.length * 100) + '%';
            // prev disabled on first step
            document.querySelectorAll('[data-prev]').forEach(b => b.disabled = (step === 1));
        }
        document.addEventListener('click', e => {
            if (e.target.closest('[data-next]')) goto(step + 1);
            if (e.target.closest('[data-prev]')) goto(step - 1);
            const sb = e.target.closest('.step-btn'); if (sb) goto(+sb.dataset.goto);
        });
        goto(step);