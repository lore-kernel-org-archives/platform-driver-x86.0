From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4 1/1] intel_telemetry_debugfs: fix oops found while
 load/unload module test
Date: Fri, 9 Jun 2017 17:34:59 -0700
Message-ID: <20170610003459.GA22981@fury>
References: <6935d670736c764f2bfdaba4bcafc6168ffa03ae.1496510090.git.priyalee.kushwaha@intel.com>
 <CAHp75Ve+Jp2N1DwPASuLpxB19pziJ4yfnWqsKstEuY2zcPVD5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:49163 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751545AbdFJAfB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Jun 2017 20:35:01 -0400
Content-Disposition: inline
In-Reply-To: <CAHp75Ve+Jp2N1DwPASuLpxB19pziJ4yfnWqsKstEuY2zcPVD5g@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: priyalee.kushwaha@intel.com, souvik.k.chakravarty@intel.com, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>

On Wed, Jun 07, 2017 at 05:42:52PM +0300, Andy Shevchenko wrote:
> On Sat, Jun 3, 2017 at 8:21 PM,  <priyalee.kushwaha@intel.com> wrote:
> > From: Priyalee Kushwaha <priyalee.kushwaha@intel.com>
> >
> > This fix oops found while testing load/unload test of
> > intel_telemetry_debugfs module. Module_init uses register_pm_notifier
> > for PM callbacks, but unregister_pm_notifier was missing from
> > module_exit.
> >
> >  [ 97.481860] BUG: unable to handle kernel paging request at ffffffffa006f010
> >  [ 97.489742] IP: blocking_notifier_chain_register+0x3a/0xa0
> >  [ 97.495898] PGD 2e0a067
> >  [ 97.495899] PUD 2e0b063
> >  [ 97.498737] PMD 179e29067
> >  [ 97.501573] PTE 0
> >
> >  [ 97.508423] Oops: 0000 1 PREEMPT SMP
> >  [ 97.512724] Modules linked in: intel_telemetry_debugfs intel_rapl gpio_keys dwc3 udc_core intel_telemetry_pltdrv intel_punit_ipc intel_telemetry_core rtc_cmos efivars x86_pkg_temp_thermal iwlwifi snd_hda_codec_hdmi soc_button_array btusb cfg80211 btrtl mei_me hci_uart btbcm mei btintel i915 bluetooth intel_pmc_ipc snd_hda_intel spi_pxa2xx_platform snd_hda_codec dwc3_pci snd_hda_core tpm_tis tpm_tis_core tpm efivarfs
> >  [ 97.558453] CPU: 0 PID: 889 Comm: modprobe Not tainted 4.11.0-rc6-intel-dev-bkc #1
> >  [ 97.566950] Hardware name: Intel Corp. Joule DVT3/SDS, BIOS GTPP181A.X64.0143.B30.1701132137 01/13/2017
> >  [ 97.577518] task: ffff8801793a21c0 task.stack: ffff8801793f0000
> >  [ 97.584162] RIP: 0010:blocking_notifier_chain_register+0x3a/0xa0
> >  [ 97.590903] RSP: 0018:ffff8801793f3c58 EFLAGS: 00010286
> >  [ 97.596802] RAX: ffffffffa006f000 RBX: ffffffff81e3ea20 RCX: 0000000000000000
> >  [ 97.604812] RDX: ffff880179eaf210 RSI: ffffffffa0131000 RDI: ffffffff81e3ea20
> >  [ 97.612821] RBP: ffff8801793f3c68 R08: 0000000000000006 R09: 000000000000005c
> >  [ 97.620847] R10: 0000000000000000 R11: 0000000000000006 R12: ffffffffa0131000
> >  [ 97.628855] R13: 0000000000000000 R14: ffff880176e35f48 R15: ffff8801793f3ea8
> >  [ 97.636865] FS: 00007f7eeba07700(0000) GS:ffff88017fc00000(0000) knlGS:0000000000000000
> >  [ 97.645948] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >  [ 97.652423] CR2: ffffffffa006f010 CR3: 00000001775ef000 CR4: 00000000003406f0
> >  [ 97.660423] Call Trace:
> >  [ 97.663166] ? 0xffffffffa0031000
> >  [ 97.666885] register_pm_notifier+0x18/0x20
> >  [ 97.671581] telemetry_debugfs_init+0x92/0x1000
> 
> Pushed to testing, thanks!
> 
> Darren, do we need this in v4.12-rcX?

If it causes an Oops, it makes sense for an rcX to me. We're currently at RC4,
so yes.

-- 
Darren Hart
VMware Open Source Technology Center
