Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C621418C326
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jul 2024 12:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721047204; cv=none; b=MfCSNaoaB0Z/OEbEwe2NiQsgDBTPEHKPt5twlWO0Y5Xeqi+cQr0Xcp5/7EXTR1mxuycUsyQCAonx3YifHoJdV8aMdLu62U/Nfmi6VwnZl07P4CpZU9EWjuwNx0NrwWZrenwbK8YkJ2RWBxEMdGlwwyao7gR1wfh6DXkMPWbypGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721047204; c=relaxed/simple;
	bh=ZK4Qa2ao+Sp0a/0eKB5jeX3Tj7w03xRV8pvIwC0R6Tw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BPVepNmWZT66MQM2UYxq4orMjqzzwBbY1cJO5hNJHyJg/9HYSh6JVvSNCZ1eXZwnBZd5ZxakKhP6s1SGf5MKchU5CMo4LmV9eOoF4V7dPJGGkInp1Ze4lLVqLfTdw89fWXGSoVYUc+EGxCvFDQ+fQqLfrA7PDtru7QaDVJWNZAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uAMhRjNm; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uAMhRjNm"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fb67f59805so255885ad.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jul 2024 05:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721047202; x=1721652002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebV2svAneHzoqVfvXDQqASdqsVudMCkn6f1Xf3OUZlI=;
        b=uAMhRjNmmnTA+yIrZbrccKDf4rrWRhzZ9FLGb50xRXXaAZjFm56EFkY8bh6bMqbS4u
         h0sFZm+Qi7V12lZ5VdjqbfwuiMWWgUVVRmeoH6LHEBeKK2SCKHLifbYWS9VGHI4YDN5a
         CyLcUzE+T61xDg9f2iuSz1mlKQCoVBbVUX6/XFgtEyekBBTVuA2SDdHIVwkHUDnCx/y2
         I+ddV43q7ozy3qjeJzlBOXRPdWbLFK+U2YEVhQ5/+vxvUxvtCPnzSsZjz9hzCjO6aLIU
         BMdd5IFqW9y7hBwbfa9NBuHxUyIG/Tx7GaG9d6adF3nmQbBJ04ZkAD2Ke09f3qdXFAvP
         AuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721047202; x=1721652002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ebV2svAneHzoqVfvXDQqASdqsVudMCkn6f1Xf3OUZlI=;
        b=NyE9fokNpC1QeZpSbVhlgldNubkcKzQxvIHMKfg+rRl48BceCy+rvxFOfir9u4eAyt
         aon/OHwu9R2Q4K6w3j+6hfTO0mYMF9ocWaqLgAss83AvoZGoWzwxpbDHimm0p8P5ESXQ
         /rmhyh65vALWWRX55g9hVmwlyl45fgxYjjHJ25f83bW9vKFKzpqoNzS9xDBuZRd1rznC
         KpseEU7m2cT/loHYYXP0R35a/+yhbSFI9dshnHSeYN2M9xKAXOahHbJUrOfbjLFAY2AU
         MzC6Mz34WPRLntTFqVuik12q1CxWnthm01ZIuLBw+ijL7cUBmIZqdq34sjZFxTBj4MPg
         wqUg==
X-Forwarded-Encrypted: i=1; AJvYcCXSk93C0sZbK2VIG2ulOLc4uGQ6G6fe2JWn1yAJENZHaJ0Nw/hOjyJNMLQvpsk1IT3kGo5bDPw1CkPUsjiW5QLEyhXeNnyRCLVhMOGZI1yEWCivSg==
X-Gm-Message-State: AOJu0YwC1N6KGWA5hlP5KaCAIQGjb3Nyi4w+tiDeoXSp41HnH+3Qjm+A
	n984TffWaV9B8SOhEa4rdRyDMHa8IG9pzOAp1oawTdSFhuoSxXP6kNA2ZE16ijP0BFSc20wTrB+
	POM6K76Yu44lp1157DCexAwD47HDH2iLcpalA
X-Google-Smtp-Source: AGHT+IFGAQP1rb2XckJmcx0Lg4r8FdKTC0mDqdp/q7dOKs0tK9zqrcYqgYd//wBH2hXoSVblQLgZdlJjLIqHvzjM/HU=
X-Received: by 2002:a17:902:e850:b0:1e4:3a10:5944 with SMTP id
 d9443c01a7336-1fc059e5ed4mr4557225ad.14.1721047201533; Mon, 15 Jul 2024
 05:40:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGcaFA3c_rc6HVVqc2=UqOgu2c7zX_XTWNx7Yf-KL7W8LgEi7A@mail.gmail.com>
 <20240703113850.2726539-1-mmaslanka@google.com> <CAE2upjS-hzciBNm+csXM+i-dnW1knBEyAwcGDya1WCezxD7M=Q@mail.gmail.com>
 <0da168ef21485ee944ceedbc1b77f3141f741dfe.camel@linux.intel.com>
In-Reply-To: <0da168ef21485ee944ceedbc1b77f3141f741dfe.camel@linux.intel.com>
From: =?UTF-8?Q?Marek_Ma=C5=9Blanka?= <mmaslanka@google.com>
Date: Mon, 15 Jul 2024 14:39:47 +0200
Message-ID: <CAGcaFA2sQNRo9UThN-C1NOLtGUJ3sKzc=pEC9wdDWMi501iLsA@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86:intel/pmc: Enable the ACPI PM Timer to be
 turned off when suspended
To: david.e.box@linux.intel.com
Cc: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
	David E Box <david.e.box@intel.com>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, Rafael J Wysocki <rjw@rjwysocki.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David

On Thu, Jul 11, 2024 at 5:34=E2=80=AFPM David E. Box
<david.e.box@linux.intel.com> wrote:
>
> Hi Marek. Thanks for the patch.
>
> On Wed, 2024-07-03 at 12:30 -0400, Rajneesh Bhardwaj wrote:
> > On Wed, Jul 3, 2024 at 7:39=E2=80=AFAM Marek Maslanka <mmaslanka@google=
.com> wrote:
> > >
> > > Allow to disable ACPI PM Timer on suspend and enable on resume. A
> > > disabled timer helps optimise power consumption when the system is
> > > suspended. On resume the timer is only reactivated if it was activate=
d
> > > prior to suspend, so unless the ACPI PM timer is enabled in the BIOS,
> > > this won't change anything.
> >
> > Back in the days IIRC, it was frowned upon but I am not sure anymore.
> > Maybe Rafael or David will have some opinion on this change. Is this
> > something that could be done in a platform specific manner such as in
> > coreboot?
>
> I discussed with Rafael. This is generally a good idea, but need to ensur=
e that
> the ACPI PM Timer isn't being used as a clock source. This could mess wit=
h the
> timekeeping system. Also, maybe a better idea is to disable it altogether=
 at
> probe time if it's not being used as a clock source. This should only be =
the
> case when TSC is unstable and HPET is unavailable, but need to confirm.
>
> David
>

From what I can see there is no possibility right now to access the
suspend_clocksource variable from outside to check what suspend clocksource=
 is
selected. I'll need to add that function.

The ACPI PM Timer can't be disabled at probe time as it might be used as a =
timer
for a watchdog.

Best,
Marek

> >
> > >
> > > Signed-off-by: Marek Maslanka <mmaslanka@google.com>
> > > ---
> > >  drivers/platform/x86/intel/pmc/adl.c  |  2 ++
> > >  drivers/platform/x86/intel/pmc/cnp.c  |  2 ++
> > >  drivers/platform/x86/intel/pmc/core.c | 37 +++++++++++++++++++++++++=
++
> > >  drivers/platform/x86/intel/pmc/core.h |  8 ++++++
> > >  drivers/platform/x86/intel/pmc/icl.c  |  2 ++
> > >  drivers/platform/x86/intel/pmc/mtl.c  |  2 ++
> > >  drivers/platform/x86/intel/pmc/spt.c  |  2 ++
> > >  drivers/platform/x86/intel/pmc/tgl.c  |  2 ++
> > >  8 files changed, 57 insertions(+)
> > >
> > > diff --git a/drivers/platform/x86/intel/pmc/adl.c
> > > b/drivers/platform/x86/intel/pmc/adl.c
> > > index e7878558fd909..9d9c07f44ff61 100644
> > > --- a/drivers/platform/x86/intel/pmc/adl.c
> > > +++ b/drivers/platform/x86/intel/pmc/adl.c
> > > @@ -295,6 +295,8 @@ const struct pmc_reg_map adl_reg_map =3D {
> > >         .ppfear_buckets =3D CNP_PPFEAR_NUM_ENTRIES,
> > >         .pm_cfg_offset =3D CNP_PMC_PM_CFG_OFFSET,
> > >         .pm_read_disable_bit =3D CNP_PMC_READ_DISABLE_BIT,
> > > +       .acpi_pm_tmr_ctl_offset =3D SPT_PMC_ACPI_PM_TMR_CTL_OFFSET,
> > > +       .acpi_pm_tmr_disable_bit =3D SPT_PMC_BIT_ACPI_PM_TMR_DISABLE,
> > >         .ltr_ignore_max =3D ADL_NUM_IP_IGN_ALLOWED,
> > >         .lpm_num_modes =3D ADL_LPM_NUM_MODES,
> > >         .lpm_num_maps =3D ADL_LPM_NUM_MAPS,
> > > diff --git a/drivers/platform/x86/intel/pmc/cnp.c
> > > b/drivers/platform/x86/intel/pmc/cnp.c
> > > index dd72974bf71e2..513c02670c5aa 100644
> > > --- a/drivers/platform/x86/intel/pmc/cnp.c
> > > +++ b/drivers/platform/x86/intel/pmc/cnp.c
> > > @@ -200,6 +200,8 @@ const struct pmc_reg_map cnp_reg_map =3D {
> > >         .ppfear_buckets =3D CNP_PPFEAR_NUM_ENTRIES,
> > >         .pm_cfg_offset =3D CNP_PMC_PM_CFG_OFFSET,
> > >         .pm_read_disable_bit =3D CNP_PMC_READ_DISABLE_BIT,
> > > +       .acpi_pm_tmr_ctl_offset =3D SPT_PMC_ACPI_PM_TMR_CTL_OFFSET,
> > > +       .acpi_pm_tmr_disable_bit =3D SPT_PMC_BIT_ACPI_PM_TMR_DISABLE,
> > >         .ltr_ignore_max =3D CNP_NUM_IP_IGN_ALLOWED,
> > >         .etr3_offset =3D ETR3_OFFSET,
> > >  };
> > > diff --git a/drivers/platform/x86/intel/pmc/core.c
> > > b/drivers/platform/x86/intel/pmc/core.c
> > > index 10c96c1a850af..e97ac7a8a18bc 100644
> > > --- a/drivers/platform/x86/intel/pmc/core.c
> > > +++ b/drivers/platform/x86/intel/pmc/core.c
> > > @@ -1171,6 +1171,35 @@ static bool pmc_core_is_pson_residency_enabled=
(struct
> > > pmc_dev *pmcdev)
> > >         return val =3D=3D 1;
> > >  }
> > >
> > > +/*
> > > + * Enable or disable APCI PM Timer
> > > + *
> > > + * @return: Previous APCI PM Timer enabled state
> > > + */
> > > +static bool pmc_core_enable_apci_pm_timer(struct pmc_dev *pmcdev, bo=
ol
> > > enable)
> > > +{
> > > +       struct pmc *pmc =3D pmcdev->pmcs[PMC_IDX_MAIN];
> > > +       const struct pmc_reg_map *map =3D pmc->map;
> > > +       bool state;
> > > +       u32 reg;
> > > +
> > > +       if (!map->acpi_pm_tmr_ctl_offset)
> > > +               return false;
> > > +
> > > +       mutex_lock(&pmcdev->lock);
> > > +
> > > +       reg =3D pmc_core_reg_read(pmc, map->acpi_pm_tmr_ctl_offset);
> > > +       state =3D !(reg & map->acpi_pm_tmr_disable_bit);
> > > +       if (enable)
> > > +               reg &=3D ~map->acpi_pm_tmr_disable_bit;
> > > +       else
> > > +               reg |=3D map->acpi_pm_tmr_disable_bit;
> > > +       pmc_core_reg_write(pmc, map->acpi_pm_tmr_ctl_offset, reg);
> > > +
> > > +       mutex_unlock(&pmcdev->lock);
> > > +
> > > +       return state;
> > > +}
> > >
> > >  static void pmc_core_dbgfs_unregister(struct pmc_dev *pmcdev)
> > >  {
> > > @@ -1446,6 +1475,10 @@ static __maybe_unused int pmc_core_suspend(str=
uct
> > > device *dev)
> > >         if (pmcdev->suspend)
> > >                 pmcdev->suspend(pmcdev);
> > >
> > > +       /* Disable APCI PM Timer */
> > > +       pmcdev->enable_acpi_pm_timer_on_resume =3D
> > > +               pmc_core_enable_apci_pm_timer(pmcdev, false);
> > > +
> > >         /* Check if the syspend will actually use S0ix */
> > >         if (pm_suspend_via_firmware())
> > >                 return 0;
> > > @@ -1500,6 +1533,10 @@ int pmc_core_resume_common(struct pmc_dev *pmc=
dev)
> > >         int offset =3D pmc->map->lpm_status_offset;
> > >         int i;
> > >
> > > +       /* Enable APCI PM Timer */
> > > +       if (pmcdev->enable_acpi_pm_timer_on_resume)
> > > +               pmc_core_enable_apci_pm_timer(pmcdev, true);
> > > +
> > >         /* Check if the syspend used S0ix */
> > >         if (pm_suspend_via_firmware())
> > >                 return 0;
> > > diff --git a/drivers/platform/x86/intel/pmc/core.h
> > > b/drivers/platform/x86/intel/pmc/core.h
> > > index 83504c49a0e31..fe1a94f693b63 100644
> > > --- a/drivers/platform/x86/intel/pmc/core.h
> > > +++ b/drivers/platform/x86/intel/pmc/core.h
> > > @@ -67,6 +67,8 @@ struct telem_endpoint;
> > >  #define SPT_PMC_LTR_SCC                                0x3A0
> > >  #define SPT_PMC_LTR_ISH                                0x3A4
> > >
> > > +#define SPT_PMC_ACPI_PM_TMR_CTL_OFFSET         0x18FC
> > > +
> > >  /* Sunrise Point: PGD PFET Enable Ack Status Registers */
> > >  enum ppfear_regs {
> > >         SPT_PMC_XRAM_PPFEAR0A =3D 0x590,
> > > @@ -147,6 +149,8 @@ enum ppfear_regs {
> > >  #define SPT_PMC_VRIC1_SLPS0LVEN                        BIT(13)
> > >  #define SPT_PMC_VRIC1_XTALSDQDIS               BIT(22)
> > >
> > > +#define SPT_PMC_BIT_ACPI_PM_TMR_DISABLE                BIT(1)
> > > +
> > >  /* Cannonlake Power Management Controller register offsets */
> > >  #define CNP_PMC_SLPS0_DBG_OFFSET               0x10B4
> > >  #define CNP_PMC_PM_CFG_OFFSET                  0x1818
> > > @@ -344,6 +348,8 @@ struct pmc_reg_map {
> > >         const u8  *lpm_reg_index;
> > >         const u32 pson_residency_offset;
> > >         const u32 pson_residency_counter_step;
> > > +       const u32 acpi_pm_tmr_ctl_offset;
> > > +       const u32 acpi_pm_tmr_disable_bit;
> > >  };
> > >
> > >  /**
> > > @@ -417,6 +423,8 @@ struct pmc_dev {
> > >         u32 die_c6_offset;
> > >         struct telem_endpoint *punit_ep;
> > >         struct pmc_info *regmap_list;
> > > +
> > > +       bool enable_acpi_pm_timer_on_resume;
> > >  };
> > >
> > >  enum pmc_index {
> > > diff --git a/drivers/platform/x86/intel/pmc/icl.c
> > > b/drivers/platform/x86/intel/pmc/icl.c
> > > index 71b0fd6cb7d84..cbbd440544688 100644
> > > --- a/drivers/platform/x86/intel/pmc/icl.c
> > > +++ b/drivers/platform/x86/intel/pmc/icl.c
> > > @@ -46,6 +46,8 @@ const struct pmc_reg_map icl_reg_map =3D {
> > >         .ppfear_buckets =3D ICL_PPFEAR_NUM_ENTRIES,
> > >         .pm_cfg_offset =3D CNP_PMC_PM_CFG_OFFSET,
> > >         .pm_read_disable_bit =3D CNP_PMC_READ_DISABLE_BIT,
> > > +       .acpi_pm_tmr_ctl_offset =3D SPT_PMC_ACPI_PM_TMR_CTL_OFFSET,
> > > +       .acpi_pm_tmr_disable_bit =3D SPT_PMC_BIT_ACPI_PM_TMR_DISABLE,
> > >         .ltr_ignore_max =3D ICL_NUM_IP_IGN_ALLOWED,
> > >         .etr3_offset =3D ETR3_OFFSET,
> > >  };
> > > diff --git a/drivers/platform/x86/intel/pmc/mtl.c
> > > b/drivers/platform/x86/intel/pmc/mtl.c
> > > index c7d15d864039d..91f2fa728f5c8 100644
> > > --- a/drivers/platform/x86/intel/pmc/mtl.c
> > > +++ b/drivers/platform/x86/intel/pmc/mtl.c
> > > @@ -462,6 +462,8 @@ const struct pmc_reg_map mtl_socm_reg_map =3D {
> > >         .ppfear_buckets =3D MTL_SOCM_PPFEAR_NUM_ENTRIES,
> > >         .pm_cfg_offset =3D CNP_PMC_PM_CFG_OFFSET,
> > >         .pm_read_disable_bit =3D CNP_PMC_READ_DISABLE_BIT,
> > > +       .acpi_pm_tmr_ctl_offset =3D SPT_PMC_ACPI_PM_TMR_CTL_OFFSET,
> > > +       .acpi_pm_tmr_disable_bit =3D SPT_PMC_BIT_ACPI_PM_TMR_DISABLE,
> > >         .lpm_num_maps =3D ADL_LPM_NUM_MAPS,
> > >         .ltr_ignore_max =3D MTL_SOCM_NUM_IP_IGN_ALLOWED,
> > >         .lpm_res_counter_step_x2 =3D TGL_PMC_LPM_RES_COUNTER_STEP_X2,
> > > diff --git a/drivers/platform/x86/intel/pmc/spt.c
> > > b/drivers/platform/x86/intel/pmc/spt.c
> > > index ab993a69e33ee..2cd2b3c68e468 100644
> > > --- a/drivers/platform/x86/intel/pmc/spt.c
> > > +++ b/drivers/platform/x86/intel/pmc/spt.c
> > > @@ -130,6 +130,8 @@ const struct pmc_reg_map spt_reg_map =3D {
> > >         .ppfear_buckets =3D SPT_PPFEAR_NUM_ENTRIES,
> > >         .pm_cfg_offset =3D SPT_PMC_PM_CFG_OFFSET,
> > >         .pm_read_disable_bit =3D SPT_PMC_READ_DISABLE_BIT,
> > > +       .acpi_pm_tmr_ctl_offset =3D SPT_PMC_ACPI_PM_TMR_CTL_OFFSET,
> > > +       .acpi_pm_tmr_disable_bit =3D SPT_PMC_BIT_ACPI_PM_TMR_DISABLE,
> > >         .ltr_ignore_max =3D SPT_NUM_IP_IGN_ALLOWED,
> > >         .pm_vric1_offset =3D SPT_PMC_VRIC1_OFFSET,
> > >  };
> > > diff --git a/drivers/platform/x86/intel/pmc/tgl.c
> > > b/drivers/platform/x86/intel/pmc/tgl.c
> > > index e0580de180773..371b4e30f1426 100644
> > > --- a/drivers/platform/x86/intel/pmc/tgl.c
> > > +++ b/drivers/platform/x86/intel/pmc/tgl.c
> > > @@ -197,6 +197,8 @@ const struct pmc_reg_map tgl_reg_map =3D {
> > >         .ppfear_buckets =3D ICL_PPFEAR_NUM_ENTRIES,
> > >         .pm_cfg_offset =3D CNP_PMC_PM_CFG_OFFSET,
> > >         .pm_read_disable_bit =3D CNP_PMC_READ_DISABLE_BIT,
> > > +       .acpi_pm_tmr_ctl_offset =3D SPT_PMC_ACPI_PM_TMR_CTL_OFFSET,
> > > +       .acpi_pm_tmr_disable_bit =3D SPT_PMC_BIT_ACPI_PM_TMR_DISABLE,
> > >         .ltr_ignore_max =3D TGL_NUM_IP_IGN_ALLOWED,
> > >         .lpm_num_maps =3D TGL_LPM_NUM_MAPS,
> > >         .lpm_res_counter_step_x2 =3D TGL_PMC_LPM_RES_COUNTER_STEP_X2,
> > > --
> > > 2.45.2.803.g4e1b14247a-goog
> > >
> >
> >
>
