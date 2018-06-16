From: Mihai =?UTF-8?Q?Don=C8=9Bu?= <mihai.dontu@gmail.com>
Subject: Re: wmi: usercopy: Kernel memory overwrite attempt detected to
 spans multiple pages (offset 0, size 4104)
Date: Sun, 17 Jun 2018 01:04:57 +0300
Message-ID: <1529186697.2784.2.camel@gmail.com>
References: <1529182886.3450.3.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529182886.3450.3.camel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sun, 2018-06-17 at 00:01 +0300, Mihai Donțu wrote:
> While trying to adjust the keyboard backlight mode, I hit this BUG:
> 
> Jun 16 22:16:07 mdontu-l kernel: usercopy: Kernel memory overwrite attempt detected to spans multiple pages (offset 0, size 4104)!
> Jun 16 22:16:07 mdontu-l kernel: ------------[ cut here ]------------
> Jun 16 22:16:07 mdontu-l kernel: kernel BUG at mm/usercopy.c:100!
> Jun 16 22:16:07 mdontu-l kernel: invalid opcode: 0000 [#1] PREEMPT SMP PTI
> Jun 16 22:16:07 mdontu-l kernel: Modules linked in: vboxpci(O) vboxnetadp(O) vboxnetflt(O) vboxdrv(O)
> Jun 16 22:16:07 mdontu-l kernel: CPU: 1 PID: 11726 Comm: smbios-keyboard Tainted: G           O    T 4.17.1-gentoo #1
> Jun 16 22:16:07 mdontu-l kernel: Hardware name: Dell Inc. Latitude E7440/07F3F4, BIOS A25 02/01/2018
> Jun 16 22:16:07 mdontu-l kernel: RIP: 0010:usercopy_abort+0x74/0x76
> Jun 16 22:16:07 mdontu-l kernel: RSP: 0018:ffff9235021b7d98 EFLAGS: 00010246
> Jun 16 22:16:07 mdontu-l kernel: RAX: 0000000000000061 RBX: ffff8be94b0d8000 RCX: 0000000000000000
> Jun 16 22:16:07 mdontu-l kernel: RDX: 0000000000000000 RSI: ffff8be95ea95538 RDI: ffff8be95ea95538
> Jun 16 22:16:07 mdontu-l kernel: RBP: 0000000000001008 R08: 00000000000ecdbf R09: 00000000000003ce
> Jun 16 22:16:07 mdontu-l kernel: R10: 0000000000000000 R11: ffffffff9384378d R12: 0000000000000000
> Jun 16 22:16:07 mdontu-l kernel: R13: ffff8be94b0d9008 R14: 0000000000000000 R15: ffff8be94e04d350
> Jun 16 22:16:07 mdontu-l kernel: FS:  00007715b596f540(0000) GS:ffff8be95ea80000(0000) knlGS:0000000000000000
> Jun 16 22:16:07 mdontu-l kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> Jun 16 22:16:07 mdontu-l kernel: CR2: 00007715b28bc350 CR3: 0000000390ee0001 CR4: 00000000001606e0
> Jun 16 22:16:07 mdontu-l kernel: Call Trace:
> Jun 16 22:16:07 mdontu-l kernel:  __check_object_size.cold.2+0x16/0x7d
> Jun 16 22:16:07 mdontu-l kernel:  wmi_ioctl+0x85/0x190
> Jun 16 22:16:07 mdontu-l kernel:  do_vfs_ioctl+0xa8/0x680
> Jun 16 22:16:07 mdontu-l kernel:  ksys_ioctl+0x60/0x90
> Jun 16 22:16:07 mdontu-l kernel:  __x64_sys_ioctl+0x16/0x20
> Jun 16 22:16:07 mdontu-l kernel:  do_syscall_64+0x6f/0x500
> Jun 16 22:16:07 mdontu-l kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> Jun 16 22:16:07 mdontu-l kernel: RIP: 0033:0x7715b461dbd7
> Jun 16 22:16:07 mdontu-l kernel: RSP: 002b:00007ffec2afb618 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> Jun 16 22:16:07 mdontu-l kernel: RAX: ffffffffffffffda RBX: 000056c3a5638bc0 RCX: 00007715b461dbd7
> Jun 16 22:16:07 mdontu-l kernel: RDX: 000056c3a5638bc0 RSI: 00000000c0345700 RDI: 0000000000000003
> Jun 16 22:16:07 mdontu-l kernel: RBP: 0000000000001008 R08: 000056c3a5638bc0 R09: 0000000000000000
> Jun 16 22:16:07 mdontu-l kernel: R10: 0000000000000000 R11: 0000000000000246 R12: 00007715b2ac9580
> Jun 16 22:16:07 mdontu-l kernel: R13: 000056c3a56323e0 R14: 00000000fffffffb R15: 0000000000000003
> Jun 16 22:16:07 mdontu-l kernel: Code: 48 0f 45 c6 48 c7 c2 e1 65 b8 92 48 c7 c6 5b 85 b7 92 51 48 0f 45 f2 48 89 f9 41 52 48 89 c2 48 c7 c7 c8 66 b8 92 e8 fd fc ea ff <0f> 0b 49 89 e8 31 c9 44 89 e2 31 f6 48 c7 c7 1c 66 b8 92 e8 74 
> Jun 16 22:16:07 mdontu-l kernel: RIP: usercopy_abort+0x74/0x76 RSP: ffff9235021b7d98
> Jun 16 22:16:07 mdontu-l kernel: ---[ end trace d1b2e9ad540f2091 ]---
> 
> I couldn't pinpoint the exact user copy call that triggers it:
> 
> (gdb) list *wmi_ioctl+0x85/0x190
> 0xffffffff81be9470 is in wmi_ioctl (drivers/platform/x86/wmi.c:816).
> 811                                            &wblock->req_buf_size,
> 812                                            sizeof(wblock->req_buf_size));
> 813     }
> 814
> 815     static long wmi_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
> 816     {
> 817             struct wmi_ioctl_buffer __user *input =
> 818                     (struct wmi_ioctl_buffer __user *) arg;
> 819             struct wmi_block *wblock = filp->private_data;
> 820             struct wmi_ioctl_buffer *buf = NULL;
> 
> I have attached my kernel config.

I eventually sprinkled some printk-s and got this:

 855         if (copy_from_user(buf, input, wblock->req_buf_size)) {
 856                 dev_dbg(&wblock->dev.dev, "Copy %llu from user failed\n",
 857                         wblock->req_buf_size);
 858                 ret = -EFAULT;
 859                 goto out_ioctl;
 860         }

Regards,

-- 
Mihai Donțu
