Return-Path: <SRS0=ZlNf=DQ=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64653C433E7
	for <platform-driver-x86@archiver.kernel.org>; Fri,  9 Oct 2020 05:33:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A2C622203
	for <platform-driver-x86@archiver.kernel.org>; Fri,  9 Oct 2020 05:33:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=malazdrewicz-com-ar.20150623.gappssmtp.com header.i=@malazdrewicz-com-ar.20150623.gappssmtp.com header.b="BKMLMcUg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729746AbgJIFdy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 9 Oct 2020 01:33:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729347AbgJIFdy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Oct 2020 01:33:54 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C18C5C0613D2
        for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2020 22:33:52 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id s7so9439813qkh.11
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Oct 2020 22:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=malazdrewicz-com-ar.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Fa6F6G8uDzowdR1QfGOsMzJQ3QVhWb0kljNFk/NSU6E=;
        b=BKMLMcUgN9paRPoVNQhKa+pm8OSy6SIXSWc0Nu0DJzGAp5dhPkqeAEbzT4OVDa/O32
         cXtOH7Mfyqb4cW02BvOGg6lrMsUdgDKnhEELZIiEwyQ8asVZn+FdQJEZO4Noq3vZ24yV
         pExo4D9TIoaG68dwQnW0aYEdw8IGk6bz+3uIqe6WxBBoDmslRPgU/63PdYEPVxSO8QJC
         6GaJfByaJdOM4lVBiPCTuB7CHgCerho/6NX+3XPkmztIt6UAPZ9dB/v5ThMtwB73oZz7
         0Tt7+725FHdx+U9S+nYa2HcZAOdb8ToFaKktPKAAOigsqqs3PWDQFnPYNkOEhFQEUNxz
         951A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Fa6F6G8uDzowdR1QfGOsMzJQ3QVhWb0kljNFk/NSU6E=;
        b=UltOOPxKQ+c8TatKkJVgwgkj6Lgak1DfNw8kVMohFfbL4G+Gr1Ri8IOft3uyLH6ruo
         tRrVUR2s8j0I8qwNgBiIupiepIqcuuvUIyxL+BPNmk41q2v1yveXitN0l80COw4Uy1pP
         xGZi/QB9fT+UqISgyL7Gsa9godC/C26srDzzjxhp/zTShXtp6mLQ/bejwW7TdA6X9TNr
         CGFyrdr5AdIvl3dgKMTe3HsXo3zA6Yko9k6QLEJ7ogC2lEcjVh3G5MiFEhcK86NW7bYJ
         LunL4FVs0oGIFB0e07l5qC0iBR0OxlOwOWYOVEBB4pPAJnem91Bk6fuF2MW9zfbFPbKc
         /v6A==
X-Gm-Message-State: AOAM530XXN7YDtYZaRpCCwfBHN65OSZyuB1qxkduKqt0yyFvQoudBJ5W
        JunF8eI0FQt8/KJ69/JqYiACCQ==
X-Google-Smtp-Source: ABdhPJziOUqFceIGyiJQcVRZRVXoY++ZvfZrcFL1f9rKPD/yjCtHqYTouSf1dh6pRvXAkGcHUSMN3A==
X-Received: by 2002:a37:7f85:: with SMTP id a127mr11906838qkd.257.1602221631857;
        Thu, 08 Oct 2020 22:33:51 -0700 (PDT)
Received: from area-51m-r2 ([24.224.201.0])
        by smtp.gmail.com with ESMTPSA id q135sm4119977qka.93.2020.10.08.22.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 22:33:51 -0700 (PDT)
Message-ID: <6ff262dee7187939a3392005b121ceec424ab6d3.camel@malazdrewicz.com.ar>
Subject: Re: [ PATCH v2 1/1] dell smbios driver : Consider Alienware a valid
 OEM String
From:   Gerardo Esteban Malazdrewicz <gerardo@malazdrewicz.com.ar>
To:     Hans de Goede <hdegoede@redhat.com>,
        "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        Pali =?ISO-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Date:   Fri, 09 Oct 2020 02:33:49 -0300
In-Reply-To: <db8e8945-065c-ee3b-fd45-1f500982a9f3@redhat.com>
References: <d17b7266b3bcc433477cf4f3b89e0b5cbf0126cb.camel@malazdrewicz.com.ar>
         <de108a8c-672f-4136-dc80-9ad7f14cea32@redhat.com>
         <DM6PR19MB26362F0581FA78C7E777BF56FA0C0@DM6PR19MB2636.namprd19.prod.outlook.com>
         <b415a7bf2e98e734cc78579159e5c88fd5cd30df.camel@malazdrewicz.com.ar>
         <768985a8-7e6e-c91a-705b-2537047d0bdf@redhat.com>
         <20201007143317.bp5lsaa75ls5lhm3@pali>
         <DM6PR19MB2636BAADCEAD0840771BF424FA0A0@DM6PR19MB2636.namprd19.prod.outlook.com>
         <45e82b6dabb591de630ac0e91a3ebb7937245fb1.camel@malazdrewicz.com.ar>
         <DM6PR19MB26363563F46E95E50AD28854FA0A0@DM6PR19MB2636.namprd19.prod.outlook.com>
         <db8e8945-065c-ee3b-fd45-1f500982a9f3@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

El mié, 07-10-2020 a las 22:38 +0200, Hans de Goede escribió:
> Hi,
> 
> On 10/7/20 9:58 PM, Limonciello, Mario wrote:
> > > -----Original Message-----
> > > From: Gerardo Esteban Malazdrewicz <gerardo@malazdrewicz.com.ar>
> > > Sent: Wednesday, October 7, 2020 14:55
> > > To: Limonciello, Mario; Pali Rohár; Hans de Goede
> > > Subject: Re: [ PATCH v2 1/1] dell smbios driver : Consider
> > > Alienware a valid
> > > OEM String
> > > 
> > > 
> > > [EXTERNAL EMAIL]
> > > 
> > > El mié, 07-10-2020 a las 15:53 +0000, Limonciello, Mario
> > > escribió:
> > > > > Hans, there are more drivers which checks for Dell DMI
> > > > > strings.
> > > > > Probably
> > > > > it would be needed to update Alienware on more places, not
> > > > > only in
> > > > > dell-smbios-base.c driver.
> > > > 
> > > > I would prefer that each of those be checked on a case by case
> > > > basis
> > > > and only
> > > > added if actually necessary.  Gerardo if you can please check
> > > > any
> > > > other drivers
> > > > that should need this string added to their allow list.
> > > 
> > > I didn't find other instances of that string in this subsystem,
> > > but see
> > > below.
> > > 
> > > There is one in pci, another in hotplug.
> > > 
> > > However, this is an extract from kernel logs:
> > > 
> > > [  138.093686] dell-smbios A80593CE-A997-11DA-B012-B622A1EF5492:
> > > WMI
> > > SMBIOS userspace interface not supported(0), try upgrading to a
> > > newer
> > > BIOS
> > 
> > Considering that messaging - does the non-WMI interface actually
> > work?
> > dell-smbios has two backends available.
> 
> Yes that is a very good question.
> 
> Gerardo, I guess you started looking into this because of the:
> 
> 	pr_err("Unable to run on non-Dell system\n");
> 
> In dell-smbios-base.c triggering on your system?

Correct, plus the top of dmidecode output, declaring SMBIOS present.

# dmidecode 3.2
Getting SMBIOS data from sysfs.
SMBIOS 3.2.0 present.
Table at 0x848B6000.


> 
> As Pali mentioned in another mail, you probably should
> be looking at the dell-laptop code, which also has a
> has a DMI string check and which uses the dell-smbios code,
> another consumer of the dell-smbios code is the dell-wmi
> driver.
> 
> If neither of those drivers add additional functionality
> (e.g. extra hotkey events, being able the control the kbd
> backlight), then the right fix might be to silence the
> error you see being thrown by dell-smbios-base.c, rather
> then allowing it to load.
> 

dell-laptop doesn't even load as is ('No such device')

However, adding an entry in dell_device_table, based on dmidecode
output (Vendor: Alienware, Type: 10), allows it to load.

But I don't know how to test for any of this additional functionality.

What should I look for?

If any is found, would do a v3.

dell|alienware lsmod output, if that helps:

$ sudo lsmod | egrep "(dell|alienware)"
dell_laptop            28672  0
dell_rbtn              20480  0
dell_rbu               20480  0
dell_wmi               20480  0
dell_smo8800           20480  0
dell_smbios            32768  2 dell_wmi,dell_laptop
dell_smm_hwmon         24576  0
ledtrig_audio          16384  3
snd_hda_codec_generic,snd_sof,dell_laptop
dcdbas                 20480  1 dell_smbios
alienware_wmi          20480  0
dell_wmi_descriptor    20480  2 dell_wmi,dell_smbios
rfkill                 28672  11
bluetooth,dell_laptop,dell_rbtn,cfg80211
sparse_keymap          16384  2 intel_hid,dell_wmi
wmi                    36864  7
intel_wmi_thunderbolt,alienware_wmi,dell_wmi,wmi_bmof,dell_smbios,dell_
wmi_descriptor,mxm_wmi
video                  53248  3 dell_wmi,dell_laptop,i915
dell|alienware lsmod output, if that helps:

> For now I'll drop your patch from my review-hans branch,
> as we first need to clear this up.
> 
> > The SMI based backend you can check by using dcdbas.
> > 
> > I had presumed from your patch that it actually worked.
> > 
> > > [ 1275.987716] dell_smm_hwmon: not running on a supported Dell
> > > system.
> > > [ 1275.987734] dell_smm_hwmon: vendor=Alienware, model=Alienware
> > > Area-
> > > 51m R2, version=1.3.0
> > > 
> > > 
> > > dell_smm_hwmon ignore_dmi=1
> > > 
> > > /sys/class/hwmon/hwmonX/pwm{1,3} access correctly the left and
> > > right
> > > fan, respectively
> 
> Ok, so that looks good and fixing the DMI check there probably
> makes sense. Note that this code is independent from the
> dell-smbios code from drivers/platform/x86 so you can
> do another patch to fix the DMI check there independent of the
> dell-smbios discussion.
> 
> Regards,
> 
> Hans

Regards,      Gerardo
> 

