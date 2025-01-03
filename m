Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31E01FAC49;
	Fri,  3 Jan 2025 18:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735930330; cv=none; b=Vc+JgCKo3/yaNNC4qEH7eYWDRRBBEC0SVF6wcNvKouJrPO4DTLiXdLqFRS90zwZJ9Y7tAtEGqUwmI/BeiB91fNIL/L1x42IRJ2Oz9S9QwsfTz5GEooUglTAJWDVgwD7i5awj2p6uG2Nm1Fnv8Djgk4MGY3y717qDiXelbPrIW7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735930330; c=relaxed/simple;
	bh=7COPce5DyBvfWv6rCXcsSZzIf4BIrSFXe+7CatGKVf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMct5Fndt3bVJs80IqjQFfzhFmsJqlsCIHb9KJvKCkY+AGvy0NHKkhV9Z13Z3uej2fC4dF3QRQAKeERfVR89DebIrk0+NlLydyNgX3Dfxpnvtbxx0F3E/TLx+k5sbb63xf+nlaxA5+dpWp83NxI6SnCI50Sdrrh2uz5rS0yrr4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bAUTAQQI; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bAUTAQQI"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6dcdf23b4edso95380726d6.0;
        Fri, 03 Jan 2025 10:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735930327; x=1736535127; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O67Gt7Nm+41MRLyd/gqoDmT3HJ7Q3EBU0IIlPuGX7E4=;
        b=bAUTAQQIolx4C/jJS1fv6sYyi/td6SFD0WbXvknkrORsce6S+AM9oj9oM4pl22uIUf
         ROJmPvHLyL1dCLu/tcK92UOLCXLG5BbYpttQ26vvPOhjDbQFnwguBfDT7LGI5H4HSFTj
         587FzesbbAG42NEGGZxokb10vdCJdPe8bSKWL2gpWo72HrNQCug8S8vPa2Efa3doFzlX
         j7FzZFfIAuMWqQg1ink7+xHeTkqaR1QxonOwEtPsR92CNnj64PtH3WlTvyhYuLWlgxar
         Mlr5MXJdNmC+m64OFskSCNk0PzqCiiv6al/7bPFttLshaSW6m0SKdV54EBLu8wnqjTPP
         gTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735930327; x=1736535127;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O67Gt7Nm+41MRLyd/gqoDmT3HJ7Q3EBU0IIlPuGX7E4=;
        b=L6ckDYWsT5uPnrLChZqEWL1+Qq+qiglRm922KdpRWxOlBiUu0LezXy4msLEwFVzTIj
         dQTxyG5w867e1kyH4Gphq1YbonTGm09x957OO1MQsXmYDYpaviK7kFn+YdCj9WaqoyuO
         mfGJpQVRiuCApenEo4wftUpxQg3jicxbrTaNVF3Ysd6nuzO092CvGrv+nV0jhlb2/W1e
         p9ouHR6Kvmf7UlX0GDkwmpn7ypsTeWd2hiCuVSU3s+a85HxBvP3GnBtc8e1YDQ/eKtM4
         Hmj9JFdgljgYcqmeenTZgU1dc1dB1AIK4j8RPH3HRNdgV0EIGS/a8Zu28oSRpDF7u8q3
         gzng==
X-Forwarded-Encrypted: i=1; AJvYcCUPvGMMfYgHKxRd1RPfgO+ovPCD/Vg7S9sF6smqLCMSK1r8LD5x5xegF676VfY8/Yx4NNXCd17mE38AAaWF@vger.kernel.org, AJvYcCWAGfPhJkUrdoIpw5WJzod7LRvBCdWstmED5/gLK5zgfJyrF23p5rGFLZLHXA5XITkSveCb1PaIuU+SOgMt9934HG9l4Q==@vger.kernel.org, AJvYcCWyhHEjDli5Fx+GgqaFaojYpGpSpsraxI2xkSINotxIyLEV6lRAlOL4AvNx4ZYDzejdBzxjNoi5pjo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTAB4Zohe9EYKwdVLZuc5NZRnEAj9whkEzdRC6FufLIclbZbKP
	HOoHEvYD/7oS+K1oRch85HzEc31jXgSJ/ychpPMk2MNdMiLxIxgP
X-Gm-Gg: ASbGnctH3tgGiFj8ZEKDY1cdZBc8nKjK/4vESD5GfZ5cOtFD7TnSGaeY5FO1eICgIDI
	/a2TmIJpwLfOM7hdYO79dO7JgQzpBoQ9d2wtsUfQ9KDdnSGqBzoClDFW59E9eazjuuwm0eHO9lM
	U0CZ+aJDAso0ph4Mt7VNUy/1OwBhyDzZTqyEHOUJ9O1n4WxPc1lkboP2EAXq8rtn5VLopC787Iw
	H6hY395uoPuv26liJpmnGtjHShGQjulxLzMJb71CFr4ISbX/UsdyDo+
X-Google-Smtp-Source: AGHT+IGbGOWob+dv/t6QZEMs/iPSZ0Q8VKU4tt4XZIlzGen6cgBhXuJjSih5JvWPpe7haU+5uXJlyg==
X-Received: by 2002:a05:6214:1313:b0:6d8:a8e1:b57b with SMTP id 6a1803df08f44-6dd2339780fmr936226006d6.36.1735930327536;
        Fri, 03 Jan 2025 10:52:07 -0800 (PST)
Received: from alphacentauri ([2800:bf0:179:113e:f067:4e25:4298:6451])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3eb1777esm147923961cf.67.2025.01.03.10.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 10:52:06 -0800 (PST)
Date: Fri, 3 Jan 2025 13:52:03 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Joshua Grisham <josh@joshuagrisham.com>
Cc: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com, W_Armin@gmx.de, 
	platform-driver-x86@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
Message-ID: <v4ch4vicbofhr2sawc6synxzf552lxukr73f2qtothdedvoafh@or3ghcu3zqcm>
References: <20241226153031.49457-1-josh@joshuagrisham.com>
 <mvp4rhnpzjdfyacuzczg2y5vms7hnarxxwbnk3pbtfx3mg3mrm@vzceo5cfjfl6>
 <CAMF+KebdvjTKYAxWqk0dMaUc=jtqw624GKyc=j4gHJ2PBQK1gA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMF+KebdvjTKYAxWqk0dMaUc=jtqw624GKyc=j4gHJ2PBQK1gA@mail.gmail.com>

On Fri, Jan 03, 2025 at 07:19:51PM +0100, Joshua Grisham wrote:
> Hi Kurt, thanks for the comments! Will respond inline below...
> 
> Den mån 30 dec. 2024 kl 18:50 skrev Kurt Borja <kuurtb@gmail.com>:
> >
> > > +     if (err)
> > > +             goto return_with_dbg;
> > > +
> > > +     galaxybook->has_kbd_backlight = true;
> > > +
> > > +     return 0;
> > > +
> > > +return_with_dbg:
> > > +     dev_dbg(&galaxybook->platform->dev,
> > > +             "failed to initialize kbd_backlight, error %d\n", err);
> > > +     return 0;
> >
> > Return `err` here.
> >
> 
> I actually intentionally want to return 0 here -- the feature is "not
> enabled" but other features of the driver can be (so probe should not
> fail and unload the module). Not all devices that have these ACPI IDs
> will have keyboard backlight (or various other features that are
> supported by this module), but do have other features, so those
> features that exist on the specific device should "work" ideally while
> others are not made available. This logic matches the behavior from
> before but just slightly refactored now to clean it up a bit. Per some
> other comments from Armin I will change a bit of this so the debug
> messages will be more clear at "point of use" so hopefully it will be
> even more clear; does this seem ok or should there also be a comment
> or clear text in the debug message that it will continue without
> failing the probe?

I thought this might have been the case, but you do propagate errors
from this method to the probe, even though it always returns 0, so it
seems that you wanted to return err instead.

To me it would be better to make this method void like 
galaxybook_profile_init() or galaxybook_battery_threshold_init(). But
I'd like to hear Armin's opinion.

> 
> > > +     int mapped_profiles;
> > >  [...]
> > > +             /* if current mode value mapped to a supported platform_profile_option, set it up */
> > > +             if (mode_profile != IGNORE_PERFORMANCE_MODE_MAPPING) {
> > > +                     mapped_profiles++;
> >
> > mapped_profiles is uninitialized!!
> >
> 
> Thank you! A total miss on my part .. and feels like just random
> chance that I have not had an issue so far (it seems like it has
> always grabbed fresh memory / a value that was already 0) but I will
> fix this :)

Thankfully, I think there are kernel configs to auto-initialize stack
variables to 0. That may be why you didn't encounter problems.

> 
> > > +     err = galaxybook_i8042_filter_install(galaxybook);
> > > +     if (err)
> > > +             return dev_err_probe(&galaxybook->platform->dev, err,
> > > +                                  "failed to initialize i8042_filter\n");
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static void galaxybook_remove(struct platform_device *pdev)
> > > +{
> > > +     if (galaxybook_ptr)
> > > +             galaxybook_ptr = NULL;
> >
> > Please someone correct me if I'm wrong.
> >
> > Device resources get released after calling the .remove callback,
> > therefore there is a small window in which the i8042 filter is *still*
> > installed after this point, which means you could dereference a NULL
> > pointer.
> >
> > I suggest not using devres for the i8042 filter.
> >
> 
> I believe you are correct, and I checked some of the driver core code
> and was able to pinpoint the exact sequence to confirm. This was also
> mentioned by Armin in a comment. My intention is that I will actually
> fold everything to do with this global pointer into the i8042 init /
> remove functions since it is the only thing that uses it, so hopefully
> all will work out ok. Also my intention further is if Armin's changes
> to add a context pointer to the i8042 filter hook get accepted and
> merged then I will move to that and remove this global pointer
> entirely :)

Yes, I'm also waiting for it to get merged. I want to implement a filter
in alienware-wmi.

> 
> Thanks again for looking into this, and please feel free to say if
> there is anything else you find or something I responded with here
> that does not sound good!

Sure :)

~ Kurt

> 
> Joshua
