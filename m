From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: Re: [PATCH 4/4] platform/x86: intel_telemetry: report debugfs failure
Date: Fri, 28 Sep 2018 14:40:58 +0530
Message-ID: <20180928091057.GA30809@raj-desk2.iind.intel.com>
References: <20180903180415.31575-1-rajneesh.bhardwaj@linux.intel.com>
 <20180903180415.31575-4-rajneesh.bhardwaj@linux.intel.com>
 <CAHp75VcE+BY=8aKEGqzkDBVazLGtwNNCa1CYCKGirS1vBLVXPg@mail.gmail.com>
 <69ad420e-362c-d8c9-331f-056cdaefb1eb@linux.intel.com>
 <CAHp75VeCC0CUmzieujpxUP1A3Mn8J9gekX6Vn-fbtD_ZFPbnYw@mail.gmail.com>
 <bb2d01ce-e2c9-18a8-7409-8c014989f732@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bb2d01ce-e2c9-18a8-7409-8c014989f732@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>, matt.turner@intel.com, "Brown, Len" <len.brown@intel.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Sep 28, 2018 at 02:44:06PM +0530, Bhardwaj, Rajneesh wrote:

Resending it since previous message had few HTML contents so it was not
delivered to the list.

>
>
> On 26-Sep-18 10:48 PM, Andy Shevchenko wrote:
> >On Wed, Sep 26, 2018 at 5:24 PM Bhardwaj, Rajneesh
> ><rajneesh.bhardwaj@linux.intel.com> wrote:
> >>On 26-Sep-18 7:26 PM, Andy Shevchenko wrote:
> >>>On Mon, Sep 3, 2018 at 9:05 PM Rajneesh Bhardwaj
> >>><rajneesh.bhardwaj@linux.intel.com> wrote:
> >>>>not be obtained and result in a invalid telemetry_plt_config.
> >>>What is telemetry_plt_config?
> >>Internal data structure that holds platform config, maintained by the
> >>telemetry platform driver.
> >You need to spell if for the reader.
>
> Sure, thanks for the suggestion. I will do it if you agree to my explanation
> below and require v2.
>
> >
> >>>>This is also applicable to the platforms where the BIOS supports IPC1
> >>>>device under debug configurations but IPC1 is disabled by user or the
> >>>>policy.
> >>>>
> >>>>This change allows user to know the reason for not seeing entries under
> >>>>/sys/kernel/debug/telemetry/* when there is no apparent failure at boot.
> >>>>+exit:
> >>>>+       pr_debug(pr_fmt(DRIVER_NAME) " Failed\n");
> >>>Completely useless.
> >>>
> >>>Device core does it in generic way.
> >>If i remove this print then perhaps there is no need of this patch.
> >Maybe.
> >
> >
> >
> >>Reason to print this is that the platform driver / core driver does not
> >>show any error.
> >If the code fails and returns 0 — it's a bug in error reporting inside the code.
>

Below are my comments as per previous mail.

> The existing Telemetry ecosystem for Atom consists of IPC driver, telem core
> driver and telem platform driver but there are no consumers of the APIs
> except the ones in telem debugfs driver. Here in this case, not all drivers
> that make up the telemetry infra return failure. Here is how the system
> looks w/wo IPC1 setting in the BIOS.
>
> When IPC is present
>
> root@raj-glk:~# lsmod | grep -i telem
>
> intel_telemetry_debugfs245760
>
> intel_telemetry_pltdrv204800
>
> intel_punit_ipc163841 intel_telemetry_pltdrv
>
> intel_telemetry_core163842 intel_telemetry_debugfs,intel_telemetry_pltdrv
>
> intel_pmc_ipc204802 intel_telemetry_debugfs,intel_telemetry_pltdrv
>
> When IPC is missing
>
> root@raj-glk:~# lsmod | grep -i telem
>
> intel_telemetry_pltdrv204800
>
> intel_punit_ipc163841 intel_telemetry_pltdrv
>
> intel_telemetry_core163841 intel_telemetry_pltdrv
>
> intel_pmc_ipc204801 intel_telemetry_pltdrv
>
>
> If we look at the dmesg log, we see  "intel_telemetry_core Init". So one
> might think that the driver has loaded fine since user may not know that
> telemetry is more than just one driver. Such things are often reported by
> users of this driver.
> So IMHO, keeping this error helps user triage the problem easily. I can
> change to pr_info you'd like it.
>
> >
> >>In-fact they are even loaded in module table. OTOH, this
> >>debugfs interface fails. This is very confusing to the users if they
> >>check the lsmod output so i feel this print might help.
> >Again, device core *already has* this and even more (it prints also a
> >return code!).
> >
>

-- 
Best Regards,
Rajneesh
