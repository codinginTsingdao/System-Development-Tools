# Lab02-Process-Python-Tooling

## q05
Process/job control and signal cleanup.
- `worker.sh`

Example workflow:
```bash
chmod +x worker.sh
./worker.sh > stdout.log 2> stderr.log
# Ctrl-Z
bg
pid=$(jobs -p)
kill -TERM "$pid"
wait "$pid"
cat cleanup.log
```

## q06
Python language-server refactoring, Ruff, and pytest.
- `math_utils.py`
- `app.py`
- `test_math_utils.py`

Check:
```bash
python3 -m ruff check .
python3 -m pytest
```

## q07
Debugging and fixing merge sort.
- `merge_sort.py`
- `test_merge_sort.py`

Check:
```bash
python3 merge_sort.py
python3 -m pytest
```

## q08
Profiling and optimization.
- `generate_words.py`
- `wordfreq_original.py` — original slow implementation
- `wordfreq.py` — optimized set-based implementation

Example workflow:
```bash
python3 generate_words.py
time python3 wordfreq_original.py
time python3 wordfreq_original.py
python3 -m cProfile -s cumulative wordfreq_original.py
time python3 wordfreq.py
time python3 wordfreq.py
```
