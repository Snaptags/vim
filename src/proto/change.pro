/* change.c */
void change_warning(int col);
void changed(void);
void changed_internal(void);
void f_listener_add(typval_T *argvars, typval_T *rettv);
void f_listener_flush(typval_T *argvars, typval_T *rettv);
void f_listener_remove(typval_T *argvars, typval_T *rettv);
void may_invoke_listeners(buf_T *buf, linenr_T lnum, linenr_T lnume, int added);
void invoke_listeners(buf_T *buf);
void changed_bytes(linenr_T lnum, colnr_T col);
void inserted_bytes(linenr_T lnum, colnr_T col, int added);
void appended_lines(linenr_T lnum, long count);
void appended_lines_mark(linenr_T lnum, long count);
void deleted_lines(linenr_T lnum, long count);
void deleted_lines_mark(linenr_T lnum, long count);
void changed_lines(linenr_T lnum, colnr_T col, linenr_T lnume, long xtra);
void unchanged(buf_T *buf, int ff, int always_inc_changedtick);
void ins_bytes(char_u *p);
void ins_bytes_len(char_u *p, int len);
void ins_char(int c);
void ins_char_bytes(char_u *buf, int charlen);
void ins_str(char_u *s);
int del_char(int fixpos);
int del_chars(long count, int fixpos);
int del_bytes(long count, int fixpos_arg, int use_delcombine);
int open_line(int dir, int flags, int second_line_indent);
int truncate_line(int fixpos);
void del_lines(long nlines, int undo);
/* vim: set ft=c : */
