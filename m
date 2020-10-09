Return-Path: <SRS0=ZlNf=DQ=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A7EDC43457
	for <platform-driver-x86@archiver.kernel.org>; Fri,  9 Oct 2020 08:27:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C378122260
	for <platform-driver-x86@archiver.kernel.org>; Fri,  9 Oct 2020 08:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602232022;
	bh=dWh6FqIEseKiRw6rWJ0cxsnxtOtEVkRIJuk9Ns+cA3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=tzwBu/pEmLXl6VHx05VtCY86wPieBGnCiMPD+OixW+HPN1dzeR1X/2vw2KFOEwuyC
	 qu8IrobHdEAjJvPd5o3DqWRH8fc5D64h/iFktsyE4Q3UDQMSaHFlETd5iismChQMBg
	 KJG6lTlNv/ce6y2cpla4lI+m/FT635+2vDonzLaA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732772AbgJII1C (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 9 Oct 2020 04:27:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:44278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732337AbgJII1C (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Oct 2020 04:27:02 -0400
Received: from pali.im (pali.im [31.31.79.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3C06A22240;
        Fri,  9 Oct 2020 08:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602232021;
        bh=dWh6FqIEseKiRw6rWJ0cxsnxtOtEVkRIJuk9Ns+cA3Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2foqAODQYJQYbZcFYAxLYPZI86lCrVopQ07i7qRoi+7hHUIToDWEnKi1sOw06c2Wa
         HSBVOVCQa5WoAKap6TzL/jOG4T3V8AthDUQCipkuCAjUf4jjLRlPlpF1Fh3cni5Q4b
         LCz/NCcXFg1TuRPrLYg/ojn4INX2yrTBahgn3kJ0=
Received: by pali.im (Postfix)
        id 92CC3515; Fri,  9 Oct 2020 10:26:58 +0200 (CEST)
Date:   Fri, 9 Oct 2020 10:26:58 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Gerardo Esteban Malazdrewicz <gerardo@malazdrewicz.com.ar>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: Re: [ PATCH v2 1/1] dell smbios driver : Consider Alienware a valid
 OEM String
Message-ID: <20201009082658.mzzfqltg7xijm6fp@pali>
References: <de108a8c-672f-4136-dc80-9ad7f14cea32@redhat.com>
 <DM6PR19MB26362F0581FA78C7E777BF56FA0C0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <b415a7bf2e98e734cc78579159e5c88fd5cd30df.camel@malazdrewicz.com.ar>
 <768985a8-7e6e-c91a-705b-2537047d0bdf@redhat.com>
 <20201007143317.bp5lsaa75ls5lhm3@pali>
 <DM6PR19MB2636BAADCEAD0840771BF424FA0A0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <45e82b6dabb591de630ac0e91a3ebb7937245fb1.camel@malazdrewicz.com.ar>
 <DM6PR19MB26363563F46E95E50AD28854FA0A0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <db8e8945-065c-ee3b-fd45-1f500982a9f3@redhat.com>
 <6ff262dee7187939a3392005b121ceec424ab6d3.camel@malazdrewicz.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ff262dee7187939a3392005b121ceec424ab6d3.camel@malazdrewicz.com.ar>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Friday 09 October 2020 02:33:49 Gerardo Esteban Malazdrewicz wrote:
> dell-laptop doesn't even load as is ('No such device')
> 
> However, adding an entry in dell_device_table, based on dmidecode
> output (Vendor: Alienware, Type: 10), allows it to load.
> 
> But I don't know how to test for any of this additional functionality.
> 
> What should I look for?

Hello! dell-laptop driver provides following features:

* rfkill interface for enabling/disabling wifi and bluetooth
  - check presence of "*dell*" by /sbin/rfkill utility

* backlight interface for controlling display brightness
  - check presence of "dell_backlight" in /sys/class/backlight/

* touchpad led (if your touchpad has some led)
  - check presence of "dell-laptop::touchpad" in /sys/class/leds

* configuring keyboard backlight
  - check presence of "dell::kbd_backlight" in /sys/class/leds

* led for microphone mute
  - check presence of "platform::micmute" in /sys/class/leds
