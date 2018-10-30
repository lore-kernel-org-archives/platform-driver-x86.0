From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 4/4] platform/x86: intel_telemetry: report debugfs failure
Date: Tue, 30 Oct 2018 15:12:22 +0200
Message-ID: <CAHp75VfkW4PkgUj3yjyeUt8GVgQwbmQGB2GxN0Jj_appTPEi_A@mail.gmail.com>
References: <20181006065113.669-1-rajneesh.bhardwaj@linux.intel.com>
 <20181006065113.669-4-rajneesh.bhardwaj@linux.intel.com> <CAHp75VfS2cB3fh1R_iQk91skU-p+yZ_X1Jx2sBaiwHmtAZ0dpw@mail.gmail.com>
 <b1d972ce-6672-344c-e432-c8bc9bb20dad@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b1d972ce-6672-344c-e432-c8bc9bb20dad@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rajneesh.bhardwaj@linux.intel.com
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, matt.turner@intel.com, "Brown, Len" <len.brown@intel.com>, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Oct 30, 2018 at 9:41 AM Bhardwaj, Rajneesh
<rajneesh.bhardwaj@linux.intel.com> wrote:
>
>
>
> On 19-Oct-18 6:09 PM, Andy Shevchenko wrote:
> > On Sat, Oct 6, 2018 at 9:54 AM Rajneesh Bhardwaj
> > <rajneesh.bhardwaj@linux.intel.com> wrote:
> >> On some Goldmont based systems such as ASRock J3455M the BIOS may not
> >> enable the IPC1 device that provides access to the PMC and PUNIT. In
> >> such scenarios, the IOSS and PSS resources from the platform device can
> >> not be obtained and result in a invalid telemetry_plt_config which is an
> >> internal data structure that holds platform config and is maintained by
> >> the telemetry platform driver.
> >>
> >> This is also applicable to the platforms where the BIOS supports IPC1
> >> device under debug configurations but IPC1 is disabled by user or the
> >> policy.
> >>
> >> This change allows user to know the reason for not seeing entries under
> >> /sys/kernel/debug/telemetry/* when there is no apparent failure at boot.
> >>
> > Pushed to my review and testing queue, thanks!
> >
> > P.S. I appended one more patch against this file, please check if it's okay.
>
> Thank you Andy. I will check it when Infradead is online.

You may check our mirror on GH:
https://github.com/dvhart/linux-pdx86

>
> >
> >> Cc: Matt Turner <matt.turner@intel.com>
> >> Cc: Len Brown <len.brown@intel.com>
> >> Cc: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
> >> Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@intel.com>
> >>
> >> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=198779
> >> Acked-by: Matt Turner <matt.turner@intel.com>
> >> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
> >> ---
> >> Changes in v2:
> >>   * Removed print and out label both as suggested by Andy.
> >>   * changed to pr_info.
> >>   * Other minor style fixes.
> >>
> >>
> >>   drivers/platform/x86/intel_telemetry_debugfs.c | 8 ++++++--
> >>   1 file changed, 6 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c b/drivers/platform/x86/intel_telemetry_debugfs.c
> >> index ffd0474b0531..1423fa8710fd 100644
> >> --- a/drivers/platform/x86/intel_telemetry_debugfs.c
> >> +++ b/drivers/platform/x86/intel_telemetry_debugfs.c
> >> @@ -951,12 +951,16 @@ static int __init telemetry_debugfs_init(void)
> >>          debugfs_conf = (struct telemetry_debugfs_conf *)id->driver_data;
> >>
> >>          err = telemetry_pltconfig_valid();
> >> -       if (err < 0)
> >> +       if (err < 0) {
> >> +               pr_info("Invalid pltconfig, ensure IPC1 device is enabled in BIOS\n");
> >>                  return -ENODEV;
> >> +       }
> >>
> >>          err = telemetry_debugfs_check_evts();
> >> -       if (err < 0)
> >> +       if (err < 0) {
> >> +               pr_info("telemetry_debugfs_check_evts failed\n");
> >>                  return -EINVAL;
> >> +       }
> >>
> >>          register_pm_notifier(&pm_notifier);
> >>
> >> --
> >> 2.17.1
> >>
> >
>


-- 
With Best Regards,
Andy Shevchenko
