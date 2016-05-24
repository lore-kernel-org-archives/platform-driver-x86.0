From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v5] platform:x86: Add PMC Driver for Intel Core SoC
Date: Tue, 24 May 2016 12:43:02 -0700
Message-ID: <20160524194302.GK2735@f23x64.localdomain>
References: <1464099946-15078-1-git-send-email-rajneesh.bhardwaj@intel.com>
 <CAHp75VfKowT6ZJ1_hy8LFWJ6dHmva3OQafOy4_LpDp4sU-jZsw@mail.gmail.com>
 <CAHp75Vd8XhcW5xr9ttyOT=5gBy3QBdeGnP8knx5fK=Nea9N0kA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75Vd8XhcW5xr9ttyOT=5gBy3QBdeGnP8knx5fK=Nea9N0kA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, dbasehore@google.com, vishwanath.somayaji@intel.com
List-Id: platform-driver-x86.vger.kernel.org

On Tue, May 24, 2016 at 10:07:32PM +0300, Andy Shevchenko wrote:
> On Tue, May 24, 2016 at 9:54 PM, Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Tue, May 24, 2016 at 5:25 PM, Rajneesh Bhardwaj
> > <rajneesh.bhardwaj@intel.com> wrote:
> 
> >> +static int pmc_core_dev_state_show(struct seq_file *s, void *unused)
> >> +{
> >> +       struct pmc_dev *pmcdev = s->private;
> >> +       u32 counter_val;
> >> +
> >> +       counter_val = pmc_core_reg_read(pmcdev,
> >> +                                       SPT_PMC_SLP_S0_RES_COUNTER_OFFSET);
> >> +       seq_printf(s, "%u\n", pmc_core_adjust_slp_s0_step(counter_val));
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static int pmc_core_dev_state_open(struct inode *inode, struct file *file)
> >> +{
> >> +       return single_open(file, pmc_core_dev_state_show, inode->i_private);
> >> +}
> >> +
> >> +static const struct file_operations pmc_core_dev_state_ops = {
> >> +       .open           = pmc_core_dev_state_open,
> >> +       .read           = seq_read,
> >> +       .llseek         = seq_lseek,
> >> +       .release        = single_release,
> >> +};
> >
> > I suppose DEFINE_SIMPLE_ATTRIBUTE might reduce amount of LOC.
> 
> Correction:
> DEFINE_DEBUGFS_ATTRIBUTE()

Andy caught the couple things I was going to add and a couple more. Please give
his feedback one more pass (except where I noted we had already covered things
like the header and the module build), and we should still be able to get this
into 4.7 if I have the next rev by tomorrow.

-- 
Darren Hart
Intel Open Source Technology Center
