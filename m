From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5] platform:x86: Add PMC Driver for Intel Core SoC
Date: Tue, 24 May 2016 22:07:32 +0300
Message-ID: <CAHp75Vd8XhcW5xr9ttyOT=5gBy3QBdeGnP8knx5fK=Nea9N0kA@mail.gmail.com>
References: <1464099946-15078-1-git-send-email-rajneesh.bhardwaj@intel.com>
	<CAHp75VfKowT6ZJ1_hy8LFWJ6dHmva3OQafOy4_LpDp4sU-jZsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:35583 "EHLO
	mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752304AbcEXTHd (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 May 2016 15:07:33 -0400
In-Reply-To: <CAHp75VfKowT6ZJ1_hy8LFWJ6dHmva3OQafOy4_LpDp4sU-jZsw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: platform-driver-x86@vger.kernel.org, "dvhart@infradead.org" <dvhart@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, dbasehore@google.com, vishwanath.somayaji@intel.com

On Tue, May 24, 2016 at 9:54 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, May 24, 2016 at 5:25 PM, Rajneesh Bhardwaj
> <rajneesh.bhardwaj@intel.com> wrote:

>> +static int pmc_core_dev_state_show(struct seq_file *s, void *unused)
>> +{
>> +       struct pmc_dev *pmcdev = s->private;
>> +       u32 counter_val;
>> +
>> +       counter_val = pmc_core_reg_read(pmcdev,
>> +                                       SPT_PMC_SLP_S0_RES_COUNTER_OFFSET);
>> +       seq_printf(s, "%u\n", pmc_core_adjust_slp_s0_step(counter_val));
>> +
>> +       return 0;
>> +}
>> +
>> +static int pmc_core_dev_state_open(struct inode *inode, struct file *file)
>> +{
>> +       return single_open(file, pmc_core_dev_state_show, inode->i_private);
>> +}
>> +
>> +static const struct file_operations pmc_core_dev_state_ops = {
>> +       .open           = pmc_core_dev_state_open,
>> +       .read           = seq_read,
>> +       .llseek         = seq_lseek,
>> +       .release        = single_release,
>> +};
>
> I suppose DEFINE_SIMPLE_ATTRIBUTE might reduce amount of LOC.

Correction:
DEFINE_DEBUGFS_ATTRIBUTE()

-- 
With Best Regards,
Andy Shevchenko
