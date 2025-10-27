Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8214716DC28
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Oct 2025 18:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761589730; cv=none; b=D/RLjI1+A2j/j9VpJ3s1mu8YIwr/0T+GllxRpkmTU/JOXjaTJ2LfyEzwThlp6/CRMeAtJ5fb77y3+B5kfXWjlgluV3uLkhgNWMAEbqYrSwJibdYcaLlNvWpRfKMnJh3j4j12hy854eOCoH27pArLkZYoEK87OXetz/eLKuKW9Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761589730; c=relaxed/simple;
	bh=sonDuXqgAsxJf5DN2NFb1AuFadqp1pVh4AhMjUdMNxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DyVKYIZBGkHZsLOD9e6wbwg2w38Hr27GglgABxIhtsiSItd++t7CcQVMF1cLi0ipRlxy+W3RZJWdM6k9rtZWlKDAURvRnYaVPgXK8QAlmSfd1Eh18HQnHEtDN8w3V2wR64Jv//pXlUpjdhpFbkajhlItGAYzuk0VjQm38NH8cJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b2/vcwjW; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2/vcwjW"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so4862053b3a.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Oct 2025 11:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761589728; x=1762194528; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KA5mHAm9fw7lh4UOKqADEPhk08u5NxNDArJjpRV8ufQ=;
        b=b2/vcwjWwhgkQ5wY1AUwdOHzQA7OMajwYrwpXPpMOE1S1HEQsNhmudFHwFPikVWXSP
         VyC69CKJ2JCbDvhUR0CpFW0gAqBD3WplKNN8GPwqrmC2qqK2Dhx9tyL0W5QgxzuYeN+7
         Y8A3beu9rv7ouDH+69VN7sUxyCcmwXngNfv8hnK4IrN7MJZxgPXW+T2NOmNud6F8CFMn
         EOGMnVMIhk4dPvHktE21OEWiPqfLWy4pbfKejK6xdKtqRmgZwOQbT2OyeI3ME5lSCiSu
         HQmiIYQQ6OCQD6Z8iP2OhAR6Gw5MexZJ156VghV5uUp8MUlzEdbwlNLtjtclaqzbsdEu
         wylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761589728; x=1762194528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KA5mHAm9fw7lh4UOKqADEPhk08u5NxNDArJjpRV8ufQ=;
        b=lXfzUAKlsNUmXwQzdQPPw2RnidGIsfCb7yWgzTH/BtF4oOVfpyzFeutLhnAvCHKKtv
         09EDmKUU2ZR4gyPmU4XWlysaR6MPJFCpcZEzLQuDEjuKX5J/uOeEfeKHY+R5Y6uQpIJC
         O6VQtSz3tL3L3KZnxlIEuqo7O8jBVjGUvEwEUwBT974T5P+snqBtBWcvqvrHZW7SVuIO
         C/7PqwvqJ4sJ0roUhMRSd/ymE9ydJPxPyNzsJM42rDhbf/5I6PhwJRjrubPPIenXb2W2
         tXBUQMsKfelRpRWIOn9/Psd8Wvb8NgNfXJc5Nk4+NOYh1xH1dwuIa91foHq4dUhLLryJ
         owgA==
X-Forwarded-Encrypted: i=1; AJvYcCVNb8wZMFZbVdE6lTQ+7Ci/uFTuZWHTMM39OIfjsExXoFXj45xwzuiCuRUhgfDeLW10WapsKYOQCyoMNAMmyxymjFQB@vger.kernel.org
X-Gm-Message-State: AOJu0YzFe7KzPlWZ0ThR+NQOPGBP5+r4pjIgBiwf42Wp6OpaT6xGbvrg
	3JessXtwoObyncCyg+CoqTBOhORLQOg5cFlC+zC2WJto/wuCNgJXJ0ST
X-Gm-Gg: ASbGnct/Tj2M6+x9HXzeR1v0fNYulGl70lALp1OnX+G9hAC/5Bl+8YBFbPPTLkgP+4Z
	ttKBgHPrl1Vsc9Z4o9oAOkC0UnB7djkTjpNHf50s8ONV1cEbbnuj9i6zqR4t6n0XlF5T6gbqj9F
	lZtZ12oWEu6tEq3K8eWwfml85igeV1jQuSD6YLYT1opE8Sdf99Jp07Ln/Y9MChPxv8NWZO08KfK
	lpIs2EYo76ieqMww4ob+WW/LZX3zbAwTyMH/NDoATZfSjm77IGW8NnzogfDiazGP/mLLbf578sL
	qQf7jL03liWl47AkXn48Vuc1K5zDqhuQ1g04yVJ58/BUDnSfpT8Fix+HutxVU5oZXvNY/NVWmt/
	rxy+Hi4x7gWU8rS8OYDoHX8wtlQyTOGHIwtER9mm2gRg5Ljg0toWMmOyDxut4QFsqtALldUY1hw
	2Zm0rP23rA5mRBjbbwl6xYREO2ecg63SWqUySC2xGSFT3LM/v+FQAV
X-Google-Smtp-Source: AGHT+IHLup+YriOoIS8yjrq5yhEMxwaINslljuBakxkZIXoQZAW1kHan1dlFghqfEmr8r8ZwZv+0Hg==
X-Received: by 2002:a05:6a20:b70f:b0:33d:7c17:deb4 with SMTP id adf61e73a8af0-344deae63admr386851637.18.1761589727653;
        Mon, 27 Oct 2025 11:28:47 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a7b0:9cae:9e24:af62])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b7128885524sm7898970a12.19.2025.10.27.11.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 11:28:47 -0700 (PDT)
Date: Mon, 27 Oct 2025 11:28:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 0/2] Input: Add keycodes for electronic privacy screen
 on/off an use these in dell-wmi
Message-ID: <crylhfmrrhev2xfokzj4elu76spbj5pa7nq2z7x3kvc4qfer3e@rnkcyfja53bh>
References: <20251020152331.52870-1-hansg@kernel.org>
 <wcrbaqheqhzpjcg3au2c5xshwwed5bjyvl5u5pske6ru7lggjs@yjpnfdbkogba>
 <dfda82fc-1c35-4986-929d-d27ba877aab6@kernel.org>
 <jnlyr7m3q7etnipczqp22ix2ijovvoqnxnopjyrey7mtbryu3c@x7snlzka3euz>
 <7f2a89c3-de22-43fa-b714-626f12fc52be@kernel.org>
 <3df27pbmdhv3x5zsfdnyttkliqdetunxwhc5e6yfbqhcbz4e45@l7ddhswxl4tk>
 <12502962-3d1e-44b0-b280-d2bae20dd1ee@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12502962-3d1e-44b0-b280-d2bae20dd1ee@kernel.org>

On Thu, Oct 23, 2025 at 03:42:04PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 22-Oct-25 10:24 PM, Dmitry Torokhov wrote:
> > On Wed, Oct 22, 2025 at 09:15:35PM +0200, Hans de Goede wrote:
> >> Hi,
> >>
> >> On 22-Oct-25 8:40 PM, Dmitry Torokhov wrote:
> >>> On Wed, Oct 22, 2025 at 08:24:46PM +0200, Hans de Goede wrote:
> >>>> Hi Dmitry,
> >>>>
> >>>> On 22-Oct-25 7:54 PM, Dmitry Torokhov wrote:
> >>>>> Hi Hans,
> >>>>>
> >>>>> On Mon, Oct 20, 2025 at 05:23:29PM +0200, Hans de Goede wrote:
> >>>>>> Hi All,
> >>>>>>
> >>>>>> Here is a patch series for adding support for the electronic privacy screen
> >>>>>> on/off events send on e.g. Dell Latitude 7300 models.
> >>>>>>
> >>>>>> On these laptops the firmware does not allow querying the presence nor
> >>>>>> the status of the eprivacy screen at boot. This makes it impossible to
> >>>>>> implement the drm connector eprivacy properties API (1) since drm objects
> >>>>>> do not allow adding new properties after creation and the presence of
> >>>>>> the eprivacy cannot be detected at boot.
> >>>>>>
> >>>>>> So instead this series adds 2 evdev keycodes for eprivacy screen on + off
> >>>>>> and modifies the dell-wmi driver to use these, so that we can still
> >>>>>> propagate these events to userspace for e.g. a DE to show an OSD.
> >>>>>>
> >>>>>> Dmitry, can we get your ack for the addition of the 2 new keycodes?
> >>>>>> I think it will be easiest if Ilpo merges the entire series through
> >>>>>> the pdx86 tree with your ack for the keycodes.
> >>>>>
> >>>>> Yes, that should be fine, although I wonder if this is best modeled as a
> >>>>> pair of keys or a single switch? I know we have touchpad on/off but I
> >>>>> wonder if it was the best option... Probably more convenient at some
> >>>>> point if it was done through the atkbd.
> >>>>
> >>>> EV_SW has the same problem as the drm property API. The mere presence
> >>>> of advertising a new SW_PRIVACY_SCREEN capability on an /dev/input/event#
> >>>> node would convey to userspace that there is an eprivacy-screen and we
> >>>> also would need to know the initial state (on/off) for using an EV_SW
> >>>> for this and we know neither presence nor status before hand (1).
> >>>
> >>> How is this different form presence of KEY_PRIVACY_SCREEN_ON/OFF? They
> >>> also imply that there is a privacy screen.
> >>
> >> I've never seen userspace change behavior depending on which keycodes
> >> are advertised as possibly being send by a device.
> > 
> > On Chrome OS we are trying to go by what peripherals report, but I can
> > see that it might not work for a generic Linux distro.
> > 
> >>
> >> Typically userspace does not care of the initial state of keys (it
> >> assumes they all start unpressed), where as for switches the initial
> >> state matters and we cannot query the initial state here.
> >>
> >>> If we really do not know if there is functionality present or not maybe
> >>> you can register a 2nd input device for the privacy switch upon
> >>> receiving the first event for it?
> >>
> >> Yes that is one of the hacks which we use for SW_TABLET_MODE, but
> >> I do really see this as a hack and I would like to avoid this if
> >> possible.
> >>
> >>>> The real issue is that the firmware does not tell us if there is
> >>>> an eprivacy screen. As mentioned the first time we find out is when
> >>>> the eprivacy screen gets toggled on or off.
> >>>>
> >>>> We are having similar issues with SW_TABLET_MODE which userspace
> >>>> uses to e.g. show / not show an on screen keyboard when a text
> >>>> entry field is focussed. So the mere presence of SW_TABLET_MODE
> >>>> can influence userspace without ever sending any events and we
> >>>> have all kind of special handling in various foo-laptop and
> >>>> intel-vbtn, etc. drivers for this, which I would like to avoid
> >>>> here.
> >>>
> >>> Probably have a similar solution: delay registration of corresponding
> >>> input device until you know the existence/state?
> >>
> >> Right that is already done in some cases. What complicates things
> >> wrt SW_TABLET_MODE is that we would like to have it present as soon
> >> as the driver probes so that a 2-in-1 which is booted in tablet mode
> >> behaves correctly from the start. Most of the firmware APIs for
> >> SW_TABLET_MODE support getting the initial state, but their implementation
> >> can be unreliable. So we only fallback to the delayed registration
> >> for known unreliable models, which requires quirks...
> >>
> >> This is getting a bit offtopic but it does show why I'm not in
> >> favor of using EV_SW style input-devices when there is no reliable
> >> initial state.
> >>
> >>>> So having ON / OFF EV_KEY events which we only generate when
> >>>> there is an actual eprivacy on/off event are by far the most KISS
> >>>> and fool proof solution.
> >>>
> >>> This assumes you assign special meaning to it (i.e. pretend that it is
> >>> not really there until you see events).
> >>
> >> As I see it there are 2 cases:
> >>
> >> 1. We can query the presence and status of the eprivacy screen at
> >> boot, this would map nicely to a SW_EPRIVACY_SCREEN, but we already
> >> have the drm properties API for this and this was put in DRM because
> >> this ties the privacy screen to a specific output which is useful
> >> to know.
> >>
> >> 2. The first thing we findout / hear about an eprivacy screen is
> >> a eprivacy on/off hotkey press. Notice the "hotkey" there iow
> >> this event gets send as the result of a key-press event.
> >>
> >> For 2. I think that just modelling this as the key events which
> >> these also happen to actually be is much simpler then dynamically
> >> registering a second input device on the first such a key press
> >>
> >> and I also think that the userspace side will be simpler with
> >> just key-press events rather then having to deal with the dynamic
> >> second device registration + reading an EV_SW .
> > 
> > OK, I agree that if you have a reliable way of querying the state you
> > can simply go with the DRM properties solution.
> > 
> > Since this keys are in effect notification only, not something that
> > userspace needs to actively handle, I don't suppose you can add another
> > state to the DRM privacy-screen hw-state: "unknown" and update it when  
> > the state becomes known?
> 
> That would break existing userspace consumers of the API and this is
> not just about not being able to query the initial state it is also
> about not being able to query if there the eprivacy screen option is
> installed at all. The presence of the drm-properties currently lets
> to userspace that there is an eprivacy screen present and e.g. will
> make gnome-control-center show a toggle to turn it on/off IIRC.

OK, fair enough. Let's merge it. I just acked the patch adding the new
keycodes, feel free to merge through the platform tree.

Thanks.

-- 
Dmitry
