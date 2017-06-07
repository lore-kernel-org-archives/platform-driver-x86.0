From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v4 1/1] intel_telemetry_debugfs: fix oops found while
 load/unload module test
Date: Wed, 7 Jun 2017 17:42:52 +0300
Message-ID: <CAHp75Ve+Jp2N1DwPASuLpxB19pziJ4yfnWqsKstEuY2zcPVD5g@mail.gmail.com>
References: <6935d670736c764f2bfdaba4bcafc6168ffa03ae.1496510090.git.priyalee.kushwaha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6935d670736c764f2bfdaba4bcafc6168ffa03ae.1496510090.git.priyalee.kushwaha@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: priyalee.kushwaha@intel.com
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, souvik.k.chakravarty@intel.com, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Jun 3, 2017 at 8:21 PM,  <priyalee.kushwaha@intel.com> wrote:
> From: Priyalee Kushwaha <priyalee.kushwaha@intel.com>
>
> This fix oops found while testing load/unload test of
> intel_telemetry_debugfs module. Module_init uses register_pm_notifier
> for PM callbacks, but unregister_pm_notifier was missing from
> module_exit.
>
>  [ 97.481860] BUG: unable to handle kernel paging request at ffffffffa006=
f010
>  [ 97.489742] IP: blocking_notifier_chain_register+0x3a/0xa0
>  [ 97.495898] PGD 2e0a067
>  [ 97.495899] PUD 2e0b063
>  [ 97.498737] PMD 179e29067
>  [ 97.501573] PTE 0
>
>  [ 97.508423] Oops: 0000 1 PREEMPT SMP
>  [ 97.512724] Modules linked in: intel_telemetry_debugfs intel_rapl gpio_=
keys dwc3 udc_core intel_telemetry_pltdrv intel_punit_ipc intel_telemetry_c=
ore rtc_cmos efivars x86_pkg_temp_thermal iwlwifi snd_hda_codec_hdmi soc_bu=
tton_array btusb cfg80211 btrtl mei_me hci_uart btbcm mei btintel i915 blue=
tooth intel_pmc_ipc snd_hda_intel spi_pxa2xx_platform snd_hda_codec dwc3_pc=
i snd_hda_core tpm_tis tpm_tis_core tpm efivarfs
>  [ 97.558453] CPU: 0 PID: 889 Comm: modprobe Not tainted 4.11.0-rc6-intel=
-dev-bkc #1
>  [ 97.566950] Hardware name: Intel Corp. Joule DVT3/SDS, BIOS GTPP181A.X6=
4.0143.B30.1701132137 01/13/2017
>  [ 97.577518] task: ffff8801793a21c0 task.stack: ffff8801793f0000
>  [ 97.584162] RIP: 0010:blocking_notifier_chain_register+0x3a/0xa0
>  [ 97.590903] RSP: 0018:ffff8801793f3c58 EFLAGS: 00010286
>  [ 97.596802] RAX: ffffffffa006f000 RBX: ffffffff81e3ea20 RCX: 0000000000=
000000
>  [ 97.604812] RDX: ffff880179eaf210 RSI: ffffffffa0131000 RDI: ffffffff81=
e3ea20
>  [ 97.612821] RBP: ffff8801793f3c68 R08: 0000000000000006 R09: 0000000000=
00005c
>  [ 97.620847] R10: 0000000000000000 R11: 0000000000000006 R12: ffffffffa0=
131000
>  [ 97.628855] R13: 0000000000000000 R14: ffff880176e35f48 R15: ffff880179=
3f3ea8
>  [ 97.636865] FS: 00007f7eeba07700(0000) GS:ffff88017fc00000(0000) knlGS:=
0000000000000000
>  [ 97.645948] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>  [ 97.652423] CR2: ffffffffa006f010 CR3: 00000001775ef000 CR4: 0000000000=
3406f0
>  [ 97.660423] Call Trace:
>  [ 97.663166] ? 0xffffffffa0031000
>  [ 97.666885] register_pm_notifier+0x18/0x20
>  [ 97.671581] telemetry_debugfs_init+0x92/0x1000

Pushed to testing, thanks!

Darren, do we need this in v4.12-rcX?

>
> Signed-off-by: Priyalee Kushwaha <priyalee.kushwaha@intel.com>
> ---
>  drivers/platform/x86/intel_telemetry_debugfs.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c b/drivers/pla=
tform/x86/intel_telemetry_debugfs.c
> index ef29f18..4cc2f4e 100644
> --- a/drivers/platform/x86/intel_telemetry_debugfs.c
> +++ b/drivers/platform/x86/intel_telemetry_debugfs.c
> @@ -97,11 +97,9 @@
>         } \
>  }
>
> -#ifdef CONFIG_PM_SLEEP
>  static u8 suspend_prep_ok;
>  static u32 suspend_shlw_ctr_temp, suspend_deep_ctr_temp;
>  static u64 suspend_shlw_res_temp, suspend_deep_res_temp;
> -#endif
>
>  struct telemetry_susp_stats {
>         u32 shlw_swake_ctr;
> @@ -807,7 +805,6 @@ static const struct file_operations telem_ioss_trc_ve=
rb_ops =3D {
>         .release        =3D single_release,
>  };
>
> -#ifdef CONFIG_PM_SLEEP
>  static int pm_suspend_prep_cb(void)
>  {
>         struct telemetry_evtlog evtlog[TELEM_MAX_OS_ALLOCATED_EVENTS];
> @@ -937,7 +934,6 @@ static int pm_notification(struct notifier_block *thi=
s,
>  static struct notifier_block pm_notifier =3D {
>         .notifier_call =3D pm_notification,
>  };
> -#endif /* CONFIG_PM_SLEEP */
>
>  static int __init telemetry_debugfs_init(void)
>  {
> @@ -960,14 +956,13 @@ static int __init telemetry_debugfs_init(void)
>         if (err < 0)
>                 return -EINVAL;
>
> -
> -#ifdef CONFIG_PM_SLEEP
>         register_pm_notifier(&pm_notifier);
> -#endif /* CONFIG_PM_SLEEP */
>
>         debugfs_conf->telemetry_dbg_dir =3D debugfs_create_dir("telemetry=
", NULL);
> -       if (!debugfs_conf->telemetry_dbg_dir)
> -               return -ENOMEM;
> +       if (!debugfs_conf->telemetry_dbg_dir) {
> +               err =3D -ENOMEM;
> +               goto out_pm;
> +       }
>
>         f =3D debugfs_create_file("pss_info", S_IFREG | S_IRUGO,
>                                 debugfs_conf->telemetry_dbg_dir, NULL,
> @@ -1014,6 +1009,8 @@ static int __init telemetry_debugfs_init(void)
>  out:
>         debugfs_remove_recursive(debugfs_conf->telemetry_dbg_dir);
>         debugfs_conf->telemetry_dbg_dir =3D NULL;
> +out_pm:
> +       unregister_pm_notifier(&pm_notifier);
>
>         return err;
>  }
> @@ -1022,6 +1019,7 @@ static void __exit telemetry_debugfs_exit(void)
>  {
>         debugfs_remove_recursive(debugfs_conf->telemetry_dbg_dir);
>         debugfs_conf->telemetry_dbg_dir =3D NULL;
> +       unregister_pm_notifier(&pm_notifier);
>  }
>
>  late_initcall(telemetry_debugfs_init);
> --
> 2.10.0
>



--=20
With Best Regards,
Andy Shevchenko
