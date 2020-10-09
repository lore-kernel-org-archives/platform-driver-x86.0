Return-Path: <SRS0=ZlNf=DQ=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F8B0C433DF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  9 Oct 2020 09:24:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B51BD2227E
	for <platform-driver-x86@archiver.kernel.org>; Fri,  9 Oct 2020 09:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602235475;
	bh=7m7NY3L4D0twRBmeOaI263sYGxjJc1Z6IXBsG/VZufg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=l8Cn2un3sLv1WFp4s8MUcKs1Z0Nv9i9pyl8gFFFQoktjgvcq4QJH3mYToZkFDifa1
	 3STMpqc5VbPKFUomaRYsmHxwgkyXdjd7Jc9aa54Ge5akRfNV18h9pVKVKgCHDWf/tU
	 VVZW9oxdl1KsSzInJkGD01mY1S5Ncy1PDfkQZPjc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733079AbgJIJYf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 9 Oct 2020 05:24:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:56426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731262AbgJIJYf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Oct 2020 05:24:35 -0400
Received: from pali.im (pali.im [31.31.79.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 096E220782;
        Fri,  9 Oct 2020 09:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602235474;
        bh=7m7NY3L4D0twRBmeOaI263sYGxjJc1Z6IXBsG/VZufg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZIvn4rXytAsfNWbrQmWUeVeuVvk8k3aLFC2gI0jp4jczf8gyxHXfj8YHZiWZRP3/g
         SyEBMTJTcy0A4ZmqqjkC/NJyILcFH23mOSnWlcInTM2pRQGsjATx78DJOeHPURaxrb
         QJt6ZHuE1Ho/3Id5X17bk0f0i22whVlWEqX3fF4s=
Received: by pali.im (Postfix)
        id BC591515; Fri,  9 Oct 2020 11:24:31 +0200 (CEST)
Date:   Fri, 9 Oct 2020 11:24:31 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Gerardo Esteban Malazdrewicz <gerardo@malazdrewicz.com.ar>,
        "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: Re: [ PATCH v2 1/1] dell smbios driver : Consider Alienware a valid
 OEM String
Message-ID: <20201009092431.r6vovkaiukx7va6j@pali>
References: <b415a7bf2e98e734cc78579159e5c88fd5cd30df.camel@malazdrewicz.com.ar>
 <768985a8-7e6e-c91a-705b-2537047d0bdf@redhat.com>
 <20201007143317.bp5lsaa75ls5lhm3@pali>
 <DM6PR19MB2636BAADCEAD0840771BF424FA0A0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <45e82b6dabb591de630ac0e91a3ebb7937245fb1.camel@malazdrewicz.com.ar>
 <DM6PR19MB26363563F46E95E50AD28854FA0A0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <db8e8945-065c-ee3b-fd45-1f500982a9f3@redhat.com>
 <6ff262dee7187939a3392005b121ceec424ab6d3.camel@malazdrewicz.com.ar>
 <20201009082658.mzzfqltg7xijm6fp@pali>
 <209751e0-159c-9d10-91de-d77435e17c4a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <209751e0-159c-9d10-91de-d77435e17c4a@redhat.com>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Friday 09 October 2020 11:14:33 Hans de Goede wrote:
> Hi,
> 
> On 10/9/20 10:26 AM, Pali Rohár wrote:
> > On Friday 09 October 2020 02:33:49 Gerardo Esteban Malazdrewicz wrote:
> > > dell-laptop doesn't even load as is ('No such device')
> > > 
> > > However, adding an entry in dell_device_table, based on dmidecode
> > > output (Vendor: Alienware, Type: 10), allows it to load.
> > > 
> > > But I don't know how to test for any of this additional functionality.
> > > 
> > > What should I look for?
> > 
> > Hello! dell-laptop driver provides following features:
> > 
> > * rfkill interface for enabling/disabling wifi and bluetooth
> >    - check presence of "*dell*" by /sbin/rfkill utility
> > 
> > * backlight interface for controlling display brightness
> >    - check presence of "dell_backlight" in /sys/class/backlight/
> > 
> > * touchpad led (if your touchpad has some led)
> >    - check presence of "dell-laptop::touchpad" in /sys/class/leds
> > 
> > * configuring keyboard backlight
> >    - check presence of "dell::kbd_backlight" in /sys/class/leds
> > 
> > * led for microphone mute
> >    - check presence of "platform::micmute" in /sys/class/leds
> 
> Thanks Pali, that is a great answer.
...
> Pali, can you perhaps make a similar feature list for
> the dell-wmi driver ?

dell-wmi is just listener for events delivered by WMI interface. All
events are currently delivered only via input device to userspace as
most of the events are key pressed or other similar events which maps to
input device. Looking at the code, there is one exception about event
KEY_KBDILLUMTOGGLE which is delivered to dell-laptop driver to notify it
when dell firmware itself decided to change keyboard backlight level.

...
> Note that the dell-wmi driver also depends on the
> dell-smbios-base module, so you should also check if the
> dell-wmi driver offers any additional functionality
> on your laptop (if it does then that would also be a reason
> to move forward with your dell-smbios-base patch).

For two Dell laptops (Dell Inspiron M5110 and Dell Vostro V131) it is
needed to call special SMBIOS function to enable receiving those WMI
events. Therefore dell-wmi checks via DMI table if that special call is
required then use dell-smbios-base module to issue needed call.

So theoretically if some key press events are not delivered on
particular dell laptop, it is a good idea to add it on that
dell_wmi_smbios_list, special SMBIOS call would be issued and check if
something is changed... But for now we know only 2 laptops which
required it (or better only 2 people complained that not all key press
events are delivered and verified that special SMBIOS call was
required).

> Regards,
> 
> Hans
> 
