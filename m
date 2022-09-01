Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6BEECAAD3
	for <platform-driver-x86@archiver.kernel.org>; Thu,  1 Sep 2022 13:37:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233856AbiIANhR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 1 Sep 2022 09:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234405AbiIANgw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 1 Sep 2022 09:36:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E45B10543
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Sep 2022 06:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662039292;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9PXGf7OkkIUM+t9kQASfUs/wnEd4T70Ll8tqP1HH2U4=;
        b=D8oWaIWF/zfp9JFiuqouhuZX128c40JIPrqx5IpJP43NLuD4H0QVicSxfRZQCYCqA66hhX
        ShFRy8DYIexTJv1PgSigU9SRK6Jm1sK+hMW6ZFPhm9TjBnLKj2ily8Z0c6UGVh/WeQNp4R
        MKN7zZWglG6mW6P9Xorwejlun4LkUyU=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-315-lKbPn7hdMx6QFre-oq6vQg-1; Thu, 01 Sep 2022 09:34:50 -0400
X-MC-Unique: lKbPn7hdMx6QFre-oq6vQg-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-11c438debc2so5951059fac.14
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Sep 2022 06:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=9PXGf7OkkIUM+t9kQASfUs/wnEd4T70Ll8tqP1HH2U4=;
        b=DTFiOtCbKUFaQkF7Ggiq4zPPxtPjPe5kkL3oEm4DfkcFoAyA4RJwJ2ZXERRYoUg99m
         XUp745OxNCEXkzmMqm7qO9RHAIIsc1G0PQX8EA+5BPZLAyllR5fMxcRKctv4b0AzbqiO
         BTT8qgzgfhl0RKLPTHQ0O7OidzKekV6k6lLiI0TtVzfWkFIiDkoibB4UseG480tH55oF
         KtdISu/tbJ5jmJkfdDg6RKFTmDZpD1UT7bDPOpkoznzJDGEPsyXnGWXWcX2B5FIWADQ5
         cNLEkk5D9dax4yjvbrYA4cJq/FjsdRVJ4oYUfpU0ijMt5q8ibdQmenfZCxpcTB4/+VTS
         k4tQ==
X-Gm-Message-State: ACgBeo3tuYiVbyJfL9jTSUfNxUTC6jvsNpDLbDhOHiozgXsb0ywoiAGc
        eVOX4N7QLjLAMDVunTPjCpHSfkpTfBzdZBVxHJmHa7dTxs5SP9H5OaRPExntI3MbCxQpEGi22tE
        FpUAYLkh99I8kiSb82tyxrHZ465czkwkGn9SX1PQV9uWjgHhTnw==
X-Received: by 2002:a05:6870:f104:b0:11f:314b:2d6d with SMTP id k4-20020a056870f10400b0011f314b2d6dmr3938484oac.41.1662039289829;
        Thu, 01 Sep 2022 06:34:49 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4tVJjkWgQEFhxslhvrjm+tTipqOn3Vy5MNVICLdpVZuod2mcRS4F46E1czjlKdrLFf8DF7oX0+KgNoI/Fn/rY=
X-Received: by 2002:a05:6870:f104:b0:11f:314b:2d6d with SMTP id
 k4-20020a056870f10400b0011f314b2d6dmr3938471oac.41.1662039289535; Thu, 01 Sep
 2022 06:34:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220823102913.4181217-1-Shyam-sundar.S-k@amd.com>
 <6ab21af2-e1c6-f76e-9bee-74e21f019be5@redhat.com> <CAKEBQogpK-Kgrgc=gb20w07XnsU7ASVjm4XHWMG=rhD0yQLUKw@mail.gmail.com>
 <a528cbe2-847b-9b15-5123-536900e0d943@redhat.com>
In-Reply-To: <a528cbe2-847b-9b15-5123-536900e0d943@redhat.com>
From:   Bastien Nocera <bnocera@redhat.com>
Date:   Thu, 1 Sep 2022 15:34:38 +0200
Message-ID: <CAKEBQoiuDA1DM4Y_EMRNpRmisCc6KAa2akwxSpbKDrDDnrB71Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] platform/x86/amd/pmf: Introduce CnQF feature for AMD PMF
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, 1 Sept 2022 at 14:44, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 9/1/22 14:24, Bastien Nocera wrote:
> > On Thu, 1 Sept 2022 at 13:16, Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Hi,
> >>
> >> On 8/23/22 12:29, Shyam Sundar S K wrote:
> >>> In this series, support for following features has been added.
> >>> - "Cool n Quiet Framework (CnQF)" is an extension to the static slider,
> >>>   where the system power can be boosted or throttled independent
> >>>   of the selected slider position.
> >>> - On the fly, the CnQF can be turned on/off via a sysfs knob.
> >>
> >> Thank you. I think that before doing a more in detail review
> >> we first need to agree on the userspace interactions here.
> >>
> >> I've added Bastien, the power-profiles-daemon maintainer
> >> to the Cc for this.
> >>
> >> From a quick peek at the patches I see that currently they do
> >> the following:
> >>
> >> Probe time:
> >> -----------
> >>
> >> 1. If static slider (classic /sys/firmware/acpi/platform_profile)
> >> is available register as a platform_profile provider
> >>
> >> 2. Query if the BIOS tells us that CnQF should be enable by
> >> default if yes then unregister the platform_profile provider
> >> and enable CnQF
> >>
> >>
> >> Run time:
> >> ---------
> >>
> >> Allow turning CnQF on/off by writing a sysfs attribute for this.
> >>
> >> 1. When CnQF gets enabled unregister the platform_profile provider
> >>
> >> 2. When CnQF gets disabled restore the last set profile and
> >> register the platform_profile provider
> >>
> >>
> >> Questions/remarks:
> >>
> >> 1. If you look at 1. and 2. under "Probe time", you will see that
> >> when the BIOS requests to have CnQF enabled by default that
> >> userspace will then still shortly see a platform_profile
> >> provider. This must be fixed IMHO by checking whether to do
> >> CnQF by default or not before the initial register call.
> >>
> >> 2. What about low-power scenarios ? Currently power-profiles-daemon
> >> will always advertise a low-power mode even when there is no
> >> platform-profile support, since this is also a hint for other
> >> parts of the system to try and conserve power. But when this
> >> mode is enabled we really want the system to also behave as
> >> if the old static slider mode is active and set to low-power.
> >>
> >> Some ideas:
> >> a) maybe still have the amd-pmf code register a (different)
> >> platform_profile provider whn in CnQF mode and have it only
> >> advertise low-power
> >>
> >> b) teach power-profiles-daemon about CnQF and have it
> >> disable CnQF when entering low-power mode?
> >>
> >> c) make the CnQF code in PMF take the charge level into
> >> account and have it not go "full throttle" when the chare
> >> is below say 25% ?
> >>
> >> 3. Bastien, can power-profiles-daemon deal with
> >> /sys/firmware/acpi/platform_profile disappearing or
> >> appearing while it is running?
> >
> > No, it doesn't.
> >
> > It expects the platform_profile file to be available on startup, at
> > worse with the choices not yet filled in. It doesn't handle the
> > platform_profile file going away, it doesn't handle the
> > platform_profile_choices file changing after it's been initially
> > filled in, and it doesn't support less than one power profile being
> > made available, and only supports hiding the performance profile if
> > the platform doesn't support it.
>
> Ok, so this means that if we go with these changes as currently
> proposed that if a user uses the sysfs file to turn CnQF on/off
> they will need to restart power-profile-daemon.
>
> I think that that is acceptable given that the user needs to manually
> poke things anyway. We should probably document this in the documentation
> for the sysfs attribute (as well as in newer versions of the p-p-d
> docs/README).
>
> > Some of those things we could change/fix, some other things will not.
> > If the platform_profile_choices file only contained a single item,
> > then power-profiles-daemon would just export the "low-power" and
> > "balanced" profiles to user-space, as it does on unsupported hardware.
>
> Right.
>
> > The profiles in power-profiles-daemon are supposed to show the user
> > intent, which having a single setting would effectively nullify.
>
> Yes that was my understanding too.
>
> > It's unclear to me how CnQF takes user intent into account (it's also
> > unclear to me how that's a low-power setting rather than a combination
> > of the existing cool and quiet settings).
>
> AMD folks, please correct me if any of the below is wrong:
>
> AFAIK even though it is called CnQF it is more like auto-profile
> selection and as such does not take user intent into account
> at all.
>
> It looks at the workload over a somewhat longer time period (say
> 5 minutes or so I guess?) and then if that consistently has been
> quite high, it will select something similar to performance.
>
> Where as for a more mixed workload it will select balanced and for
> a mostly idle machine it will select low-power.
>
> I guess this auto feature is best treated the same as unsupported hw.
>
> > (it's also
> > unclear to me how that's a low-power setting rather than a combination
> > of the existing cool and quiet settings).
>
> Even though it is called cool and quiet AFAIK it won't be all that
> cool and quiet when running a heavy workload. Which is why I wonder
> how to re-conciliate this with showing low-power in e.g. the
> GNOME shell system men. Because in essence even if the battery
> is low the system will still go full-throttle when confronted
> with a heavy workload.
>
> So selecting low-power would result in the screen-dimming which
> I think is part of that, but the CPU's max power-consumption won't
> get limited as it would when platform-profiles are supported.
>
> So I guess this is indeed very much like how p-p-d behaves
> on unsupported hw...
>
> ###
>
> As mentioned I guess one option would be for CnQF to
> still register a platform_profile provider and then in
> balanced mode do its CnQF thing and in low-power mode
> disable CnQF and apply the static-slider low-power settings
> I think that that would work best from things actual
> working in a way I would expect the avarage end-user to
> expect things to work.
>
> So p-p-d would then still see platform-profile support
> in CnQF mode but with only low-power + balanced advertised.
>
> Bastien would that work for you?

That's something I can make work, yes.

> AMD folks would that also work for you ?
>
> ###
>
> I'm also wondering if we are going to still export
> balanced + low-power modes to userspace in CnQF mode
> and disable CnQF in low-power mode then if we
> even need a sysfs knob to turn it on/off at all.
>
> I guess the sysfs knob would then still be useful
> to turn it on on systems where it defaults to off
> in the BIOS.  Might be better to do this as
> a kernel-cmdline (module-param) then though, then we
> also avoid the problem of platform_profile support
> all of a sudden changing underneath's p-p-d's feet.

I would say that, you could probably have CnQF transparently replacing
the more static "balanced" profile if it is available, and have a
separate setting to force enable/disable it as a kernel command-line
for debugging or if the BIOS menu doesn't offer it as an option.

That way the balanced mode would work like a more refined automatic
profile switcher, and make the default experience better, without the
disappearing profiles, or the user-space API headaches.

