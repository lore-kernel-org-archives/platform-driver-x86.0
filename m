From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: kernel BUG at net/core/dev.c:LINE! (3)
Date: Fri, 24 Jul 2020 01:20:21 +0300
Message-ID: <20200723222021.GY3703480@smile.fi.intel.com>
References: <000000000000ba65ba05a2fd48d9@google.com>
 <000000000000467ece05ab223d81@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000000000000467ece05ab223d81@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: syzbot <syzbot+af23e7f3e0a7e10c8b67@syzkaller.appspotmail.com>
Cc: andy@greyhouse.net, andy@infradead.org, arnd@arndb.de, davem@davemloft.net, dvhart@infradead.org, gregkh@linuxfoundation.org, j.vosburgh@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, peterz@infradead.org, platform-driver-x86@vger.kernel.org, skunberg.kelsey@gmail.com, syzkaller-bugs@googlegroups.com, tglx@linutronix.de, vfalico@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jul 23, 2020 at 02:07:08PM -0700, syzbot wrote:
> syzbot has bisected this issue to:
> 
> commit 5a707af10da95a53a55011a612e69063491020d4
> Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Date:   Fri Apr 21 13:36:06 2017 +0000
> 
>     platform/x86: wmi: Describe function parameters

Seems like random commit for known problem.

> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14a9ad40900000
> start commit:   994e99a9 Merge tag 'platform-drivers-x86-v5.8-2' of git://..
> git tree:       upstream
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=16a9ad40900000
> console output: https://syzkaller.appspot.com/x/log.txt?x=12a9ad40900000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=e944500a36bc4d55
> dashboard link: https://syzkaller.appspot.com/bug?extid=af23e7f3e0a7e10c8b67
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12ea63cf100000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14afdb9f100000
> 
> Reported-by: syzbot+af23e7f3e0a7e10c8b67@syzkaller.appspotmail.com
> Fixes: 5a707af10da9 ("platform/x86: wmi: Describe function parameters")
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

-- 
With Best Regards,
Andy Shevchenko
