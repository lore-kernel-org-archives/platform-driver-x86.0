Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023D0C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Nov 2021 22:59:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243700AbhKXXCO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 24 Nov 2021 18:02:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230265AbhKXXCO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Nov 2021 18:02:14 -0500
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5F11C061574
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Nov 2021 14:59:03 -0800 (PST)
Date:   Wed, 24 Nov 2021 23:59:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=t-8ch.de; s=mail;
        t=1637794742; bh=b2+GWxd+LJBGXi7HsW1IAbOnaqqMBBLC7Msjncj+h1U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L5THjt2lGisTpdhKNEvr7FkA3BdkgPxScLMaFE1uIoR8yiWQ5lwFm0ubXycxgw1yU
         8jK9YujRD7srFu+gEWQWUTAra8w/38Ye2aLa3kbCHrKHDBpJN01EAfqRb7be53A03z
         CkhPScqOjPQc3bpeFFRQHJ7I9kuBRP+qpYEU9h/w=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/2] platform/x86: thinkpad_acpi: Add lid-logo-led to the
 list of safe LEDs
Message-ID: <ce072aa8-90b5-46e1-9bb9-f103286cec81@t-8ch.de>
References: <20211123210524.266705-1-hdegoede@redhat.com>
 <20211123210524.266705-2-hdegoede@redhat.com>
 <ca16bf3e-2efe-49a6-94a2-4aeb66f398dc@t-8ch.de>
 <eeaa722c-b1e5-477f-d683-f4e55e50f8b5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eeaa722c-b1e5-477f-d683-f4e55e50f8b5@redhat.com>
Jabber-ID: thomas@t-8ch.de
X-Accept: text/plain, text/html;q=0.2, text/*;q=0.1
X-Accept-Language: en-us, en;q=0.8, de-de;q=0.7, de;q=0.6
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2021-11-24 17:28+0100, Hans de Goede wrote:
> On 11/24/21 16:53, Thomas Weißschuh wrote:
> > Hi,
> > 
> > On 2021-11-23 22:05+0100, Hans de Goede wrote:
> >> There have been various bugs / forum threads about allowing control of
> >> the LED in the ThinkPad logo on the lid of various models.
> >>
> >> This seems to be something which users want to control and there really
> >> is no reason to require setting CONFIG_THINKPAD_ACPI_UNSAFE_LEDS for this.
> >>
> >> The lid-logo-led is LED number 10, so change the name of the 10th led
> >> from unknown_led2 to lid_logo_led and add it to the TPACPI_SAFE_LEDS mask.
> >>
> >> Link: https://www.reddit.com/r/thinkpad/comments/7n8eyu/thinkpad_led_control_under_gnulinux/
> >> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1943318
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>  drivers/platform/x86/thinkpad_acpi.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> >> index 49fdf16b2db9..28f0299ecab0 100644
> >> --- a/drivers/platform/x86/thinkpad_acpi.c
> >> +++ b/drivers/platform/x86/thinkpad_acpi.c
> >> @@ -5661,11 +5661,11 @@ static const char * const tpacpi_led_names[TPACPI_LED_NUMLEDS] = {
> >>  	"tpacpi::standby",
> >>  	"tpacpi::dock_status1",
> >>  	"tpacpi::dock_status2",
> >> -	"tpacpi::unknown_led2",
> >> +	"tpacpi::lid_logo_led",
> > 
> > The suffix "_led" looks a bit redundant. Also non of the other LEDs have it.
> 
> Hmm, good point, but without the _led to me it sounds as if it controls
> some backlight for the entire logo, where it really is just the dot of the i.

lid_logo_dot? Not sure it's worth the bikeshedding :-)

Thomas
