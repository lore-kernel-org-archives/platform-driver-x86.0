Return-Path: <SRS0=isCl=DO=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3DEC4363D
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 14:33:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4042C212CC
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 14:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602081201;
	bh=c5q2NwPMQIU4hhSS8yq3Lf47dwf+lr+WVWV+ODdVn5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=UrVVzJBmCNhXeQvDQGz3OL+RzIected/SrNv32ULrGm1WaDn1G4U4URqF5ci9Y+va
	 CmaaxP3YqWhEaNqSew6+mctLXFkPqinBx5BvicLhE+hTDKfiN1J8pVJdnaACuw5eoy
	 U7moqmSKwP5rKyts1XrafX7e1nbcYgs3rPCkUdwg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728562AbgJGOdU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Oct 2020 10:33:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:37592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728535AbgJGOdU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Oct 2020 10:33:20 -0400
Received: from pali.im (pali.im [31.31.79.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 90914208C7;
        Wed,  7 Oct 2020 14:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602081199;
        bh=c5q2NwPMQIU4hhSS8yq3Lf47dwf+lr+WVWV+ODdVn5M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P4st3RkzfdK2HVJ2w2+KkeV1W8gAQdSYsv9pEFy+RZNwyxG7qjasY2wt3dKgPE7P4
         LLiTBm5tNVzLIHxIAApns5AV25Yw6E8nZH8Aw3uGxBOuMtFDLSCVduCnnRj/SCk8WW
         UNtputOw1B9QIn6f7BvpskMpPWMgXTywk8QKkwsw=
Received: by pali.im (Postfix)
        id 2C13A5FF; Wed,  7 Oct 2020 16:33:17 +0200 (CEST)
Date:   Wed, 7 Oct 2020 16:33:17 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>,
        Gerardo Esteban Malazdrewicz <gerardo@malazdrewicz.com.ar>
Cc:     "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: Re: [ PATCH v2 1/1] dell smbios driver : Consider Alienware a valid
 OEM String
Message-ID: <20201007143317.bp5lsaa75ls5lhm3@pali>
References: <d17b7266b3bcc433477cf4f3b89e0b5cbf0126cb.camel@malazdrewicz.com.ar>
 <de108a8c-672f-4136-dc80-9ad7f14cea32@redhat.com>
 <DM6PR19MB26362F0581FA78C7E777BF56FA0C0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <b415a7bf2e98e734cc78579159e5c88fd5cd30df.camel@malazdrewicz.com.ar>
 <768985a8-7e6e-c91a-705b-2537047d0bdf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <768985a8-7e6e-c91a-705b-2537047d0bdf@redhat.com>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wednesday 07 October 2020 16:21:12 Hans de Goede wrote:
> Hi,
> 
> On 10/6/20 5:23 AM, Gerardo Esteban Malazdrewicz wrote:
> >  From bda6b6db0d76186ff37ffce8ac836379447ef2bc Mon Sep 17 00:00:00 2001
> > From: Gerardo Malazdrewicz <36243997+GerMalaz@users.noreply.github.com>
> > Date: Sat, 3 Oct 2020 07:43:02 -0300
> > Subject: [PATCH] dell-smbios-base: Consider Alienware a Dell system
> 
> These lines are no supposed to be part of the body of the email
> and the actual patch itself has been line-wrapped breaking it.
> 
> I've fixed this up manually this time. But next time please use
> git send-email to submit patches to avoid breakage like this.

Gerardo, if you have a problems with sending patches, you can look into
kernel howto guide where are written lot of details:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html

And in case you cannot use preferred 'git send-email' command for
sending patches as Hans pointed, look into following page where are
written hints how to configure different email clients to not mangle /
line wrap patches:

https://www.kernel.org/doc/html/latest/process/email-clients.html#email-clients

> Thank you for your patch, I've applied this patch to me review-hans branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
> 
> Note it will show up there once I've pushed my local branch there,
> which might take a while.
> 
> Once I've run some tests on this branch the patches there will be added
> to the platform-drivers-x86/for-next branch and eventually will be
> included in the pdx86 pull-request to Linus for the next merge-window.
> 
> Regards,
> 
> Hans

Hans, there are more drivers which checks for Dell DMI strings. Probably
it would be needed to update Alienware on more places, not only in
dell-smbios-base.c driver.

> 
> 
> > 
> > Alienware has been a subsidiary of Dell since 2006.
> > 
> > 2020 Alienware laptop:
> > $ sudo dmidecode | head -3
> > # dmidecode 3.2
> > Getting SMBIOS data from sysfs.
> > SMBIOS 3.2.0 present.
> > $ sudo dmidecode | grep -A 29 "OEM Strings"
> > OEM Strings
> > 	String 1: Alienware
> > 	String 2: 1[099B]
> > 	String 3: 3[1.0]
> > 	String 4: 4[0001]
> > 	String 5: 5[0000]
> > 	String 6: 6[D0, D4, D8, DA, DE]
> > 	String 7: 7[]
> > 	String 8: 8[]
> > 	String 9: 9[]
> > 	String 10: 10[1.3.0]
> > 	String 11: 11[]
> > 	String 12: 12[]
> > 	String 13: 13[P38E002]
> > 	String 14: 14[0]
> > 	String 15: 15[0]
> > 	String 16: 16[0]
> > 	String 17: 17[0000000000000000]
> > 	String 18: 18[0]
> > 	String 19: 19[1]
> > 	String 20: 20[]
> > 	String 21: 21[]
> > 	String 22: <BAD INDEX>
> > 	String 23: <BAD INDEX>
> > 	String 24: <BAD INDEX>
> > 	String 25: <BAD INDEX>
> > 	String 26: <BAD INDEX>
> > 	String 27: <BAD INDEX>
> > 	String 28: <BAD INDEX>
> > 
> > 2013 Alienware laptop:
> > OEM Strings
> >          String 1: Dell System
> >          String 2: 1[05AA]
> >          String 3: 14[2]
> >          String 4: 15[0]
> >          String 5: String5 for Original Equipment Manufacturer
> > 
> > Don't know when the OEM String changed.
> > Change tested in the 2020 laptop, loads dell_smbios without further
> > issues.
> > 
> > Signed-off-by: Gerardo E. Malazdrewicz <gerardo@malazdrewicz.com.ar>
> > Reviewed-by: Mario Limonciello <mario.limonciello@dell.com>
> > ---
> >   drivers/platform/x86/dell-smbios-base.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/platform/x86/dell-smbios-base.c
> > b/drivers/platform/x86/dell-smbios-base.c
> > index 2e2cd565926aa..5ad6f7c105cf3 100644
> > --- a/drivers/platform/x86/dell-smbios-base.c
> > +++ b/drivers/platform/x86/dell-smbios-base.c
> > @@ -564,7 +564,8 @@ static int __init dell_smbios_init(void)
> >   	int ret, wmi, smm;
> >   	if (!dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "Dell System",
> > NULL) &&
> > -	    !dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "www.dell.com",
> > NULL)) {
> > +	    !dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "www.dell.com",
> > NULL) &&
> > +	    !dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "Alienware",
> > NULL)) {
> >   		pr_err("Unable to run on non-Dell system\n");
> >   		return -ENODEV;
> >   	}
> > 
> > 
> > 
> 
