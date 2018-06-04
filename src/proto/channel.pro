/* channel.c */
void ch_logfile(char_u *fname, char_u *opt);
int ch_log_active(void);
channel_T *add_channel(void);
int has_any_channel(void);
int channel_unref(channel_T *channel);
int free_unused_channels_contents(int copyID, int mask);
void free_unused_channels(int copyID, int mask);
void channel_gui_register_all(void);
channel_T *channel_open(char *hostname, int port_in, int waittime, void (*nb_close_cb)(void));
channel_T *channel_open_func(typval_T *argvars);
void channel_set_pipes(channel_T *channel, sock_T in, sock_T out, sock_T err);
void channel_set_job(channel_T *channel, job_T *job, jobopt_T *options);
void channel_set_options(channel_T *channel, jobopt_T *opt);
void channel_set_req_callback(channel_T *channel, ch_part_T part, char_u *callback, partial_T *partial, int id);
void channel_buffer_free(buf_T *buf);
void channel_write_any_lines(void);
void channel_write_new_lines(buf_T *buf);
readq_T *channel_peek(channel_T *channel, ch_part_T part);
char_u *channel_first_nl(readq_T *node);
char_u *channel_get(channel_T *channel, ch_part_T part);
void channel_consume(channel_T *channel, ch_part_T part, int len);
int channel_collapse(channel_T *channel, ch_part_T part, int want_nl);
int channel_can_write_to(channel_T *channel);
int channel_is_open(channel_T *channel);
int channel_has_readahead(channel_T *channel, ch_part_T part);
char *channel_status(channel_T *channel, int req_part);
void channel_info(channel_T *channel, dict_T *dict);
void channel_close(channel_T *channel, int invoke_close_cb);
void channel_close_in(channel_T *channel);
void channel_clear(channel_T *channel);
void channel_free_all(void);
void common_channel_read(typval_T *argvars, typval_T *rettv, int raw);
channel_T *channel_fd2channel(sock_T fd, ch_part_T *partp);
void channel_handle_events(int only_keep_open);
int channel_any_keep_open(void);
void channel_set_nonblock(channel_T *channel, ch_part_T part);
int channel_send(channel_T *channel, ch_part_T part, char_u *buf_arg, int len_arg, char *fun);
void ch_expr_common(typval_T *argvars, typval_T *rettv, int eval);
void ch_raw_common(typval_T *argvars, typval_T *rettv, int eval);
int channel_poll_setup(int nfd_in, void *fds_in, int *towait);
int channel_poll_check(int ret_in, void *fds_in);
int channel_select_setup(int maxfd_in, void *rfds_in, void *wfds_in, struct timeval *tv, struct timeval **tvp);
int channel_select_check(int ret_in, void *rfds_in, void *wfds_in);
int channel_parse_messages(void);
int channel_any_readahead(void);
int set_ref_in_channel(int copyID);
ch_part_T channel_part_send(channel_T *channel);
ch_part_T channel_part_read(channel_T *channel);
ch_mode_T channel_get_mode(channel_T *channel, ch_part_T part);
int channel_get_timeout(channel_T *channel, ch_part_T part);
void clear_job_options(jobopt_T *opt);
void free_job_options(jobopt_T *opt);
int get_job_options(typval_T *tv, jobopt_T *opt, int supported, int supported2);
channel_T *get_channel_arg(typval_T *tv, int check_open, int reading, ch_part_T part);
void job_free_all(void);
int job_any_running(void);
int win32_build_cmd(list_T *l, garray_T *gap);
void job_cleanup(job_T *job);
int set_ref_in_job(int copyID);
void job_unref(job_T *job);
int free_unused_jobs_contents(int copyID, int mask);
void free_unused_jobs(int copyID, int mask);
job_T *job_alloc(void);
void job_set_options(job_T *job, jobopt_T *opt);
void job_stop_on_exit(void);
int has_pending_job(void);
void job_check_ended(void);
job_T *job_start(typval_T *argvars, char **argv_arg, jobopt_T *opt_arg);
char *job_status(job_T *job);
void job_info(job_T *job, dict_T *dict);
void job_info_all(list_T *l);
int job_stop(job_T *job, typval_T *argvars, char *type);
void invoke_prompt_callback(void);
/* vim: set ft=c : */
