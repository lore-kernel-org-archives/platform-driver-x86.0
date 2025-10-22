Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8398F34DB6F
	for <platform-driver-x86@vger.kernel.org>; Wed, 22 Oct 2025 18:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761158432; cv=none; b=EEdxD7FCnkpbrESnrufcUngRgl084GIJBCTbuWG1GPIsg0hPJh5bBOOOdaYaidb6okdQ3CiFM1VSauyNzXdIsXATLlZxpzj68/Qvi8otZbvp+7QjsRr2TgXG1qdpFD9iWZ/uqL8RMnfteagnMLPM3OG6yFs3St3vAjJi+X8dw0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761158432; c=relaxed/simple;
	bh=xhOJrQU+0i4XkQm9Y/1PUfrkUyl17OmwI5a5oWKZvzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7dbqUn9lsmWVPjKGZcVsB/UG+J8EaagUSfpJkj0oQ4Q+/zPz1kna0+ipI0q8ZDtEDAxIvlMC3lZp0WbM1x8nKNyy9Aa25QpVNJccFm6C5iIUR72QNT7INUkARmUBWQgmFv6D2IhEjdh9CVHK3l0nAZVP4L42cLG5qT63BXceUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DXKfTVJ6; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DXKfTVJ6"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-292fd52d527so18124455ad.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Oct 2025 11:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761158430; x=1761763230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TpGfJbgMg4lko9LHO0NpToLK8f5wZg8c9uHEuwrOot0=;
        b=DXKfTVJ6zQBy/5pUeMQRSA0lFnDjJrzOlFtbC4RcaqqKZ2HKAxZO3fegT58jzcTzZx
         qxkkO4r6rTM0VtKCVGZslGYMl/aJdYqIclyRr+UFUc/b+6kM78zIDY+t9embF+eIHUXk
         +wlhv5KAbMzovyTiByVsqja09OCerNBQG+eFRpugzei5tFNw+VvmEPNAlb9Fdr45f+6X
         Dxs0SsCJBPzU3XYTDKRT9n0LdSOCP8y2W7+WVv5cetzR1Uh0xs6MuePrAWSZdX6LoSdp
         tWKceeUS0BU0nnChtRea1T6RkVNAd6JHpO18gNKgrD226ZE/4rMDK291keKvAAkX5lui
         Y35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761158430; x=1761763230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TpGfJbgMg4lko9LHO0NpToLK8f5wZg8c9uHEuwrOot0=;
        b=QIltGB4kFsC7GUHdbHFpHeaMqwN0ZIF2fgJSfWx0oF+1aRkviZ28tiNHcRPDm/rcuI
         78roEuE0hhVww1bmfJZEbzJbVB8v+kO/FzGkCgDKS1+GLb73zxyrVRHONaKj9KqvbjzJ
         D6cGoiDMS9rD9Gy0zJQKp9uayfTwCybGEUhQbIP/+2pC8x54rcYEkAFMEM9HNJONe+fr
         kHPD95bCL0jdulJ0koLu2PXMAsEFiM4MLLVWFVhWgc3aE3aKRsl1QUIzKMwcxqEvs59Z
         7WIxn0iSB3gwNCr6gZk86SSreodIbyN+NfCmDSO34Q2M8fEI7vDRZS/Wlehk0476qwv8
         L8eg==
X-Forwarded-Encrypted: i=1; AJvYcCUyfRqT1dPRybMxtTwDPNMAD3sVhAG2fqI8rQ8D1kbVR5yHqYJdRiL4pZPLfDYX6tsOg2mzlrT238yrsBDS+FGmqE6y@vger.kernel.org
X-Gm-Message-State: AOJu0YzwNtdjHpyD0tl+bGL/GzJuwndppelT3jaMXru1EbfzL2yJswpu
	bPRnqp7AHDPYilp1M349KlZ+UOTj+iiJLlVkzN9HmE4nh1CpKAz/6AiA
X-Gm-Gg: ASbGnctTDvLINUxGjmt4SHF7WxuSUDGu5YlfjWoaX5mKYdTdC9lx8X7EzhflV26TvI/
	oaPl7lNOKYwCoVn4E7v6YzR+Km1LZcvfa47rkeKtioJDpjftaiHCFDKaOANKI8ke1mKFziE3IB+
	vxgUZq6tyfpG9HRHJXWpn5KBYifiUUYkyJbbaDqqueCcoSK1cHGsRIY30F83N/EVqme0wltlTn6
	59S7zrmrFx75dcx71IqYoIQDCPyIKDYfTSFmuDrmzAJqnFSYwi1diEGA+2pZqrfcbOqI/aX6Ejt
	iatZW5dF5Ndwhu+D0IDWF7xwlws90zH67mMa7Uc9Dlg2HGqSm1j0jGTy5j/myYa+FQj4JBzjHXq
	WAMdU14FzZXzig09k/5eOWgM0bWiwrx1tFdVKnM9Hl8PrfqiNCAi5YD6ULCDLCKCnJzbUOSDhOb
	9TCtRchLMa3Os19E+MikDTjzpIfcRhX5MsDEUf0EM=
X-Google-Smtp-Source: AGHT+IFAG6+7VmJaJSQdqYZKmA+6iNmKnqsMRAuBCE8dSkzwMSEsAKIBXG6J3+FDac/HnAvFImXAOg==
X-Received: by 2002:a17:902:e88e:b0:250:1c22:e78 with SMTP id d9443c01a7336-290c9c89c9amr293067705ad.1.1761158429640;
        Wed, 22 Oct 2025 11:40:29 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:53a9:459c:bdc:6273])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ebce3asm145271355ad.17.2025.10.22.11.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 11:40:29 -0700 (PDT)
Date: Wed, 22 Oct 2025 11:40:26 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 0/2] Input: Add keycodes for electronic privacy screen
 on/off an use these in dell-wmi
Message-ID: <jnlyr7m3q7etnipczqp22ix2ijovvoqnxnopjyrey7mtbryu3c@x7snlzka3euz>
References: <20251020152331.52870-1-hansg@kernel.org>
 <wcrbaqheqhzpjcg3au2c5xshwwed5bjyvl5u5pske6ru7lggjs@yjpnfdbkogba>
 <dfda82fc-1c35-4986-929d-d27ba877aab6@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfda82fc-1c35-4986-929d-d27ba877aab6@kernel.org>

On Wed, Oct 22, 2025 at 08:24:46PM +0200, Hans de Goede wrote:
> Hi Dmitry,
> 
> On 22-Oct-25 7:54 PM, Dmitry Torokhov wrote:
> > Hi Hans,
> > 
> > On Mon, Oct 20, 2025 at 05:23:29PM +0200, Hans de Goede wrote:
> >> Hi All,
> >>
> >> Here is a patch series for adding support for the electronic privacy screen
> >> on/off events send on e.g. Dell Latitude 7300 models.
> >>
> >> On these laptops the firmware does not allow querying the presence nor
> >> the status of the eprivacy screen at boot. This makes it impossible to
> >> implement the drm connector eprivacy properties API (1) since drm objects
> >> do not allow adding new properties after creation and the presence of
> >> the eprivacy cannot be detected at boot.
> >>
> >> So instead this series adds 2 evdev keycodes for eprivacy screen on + off
> >> and modifies the dell-wmi driver to use these, so that we can still
> >> propagate these events to userspace for e.g. a DE to show an OSD.
> >>
> >> Dmitry, can we get your ack for the addition of the 2 new keycodes?
> >> I think it will be easiest if Ilpo merges the entire series through
> >> the pdx86 tree with your ack for the keycodes.
> > 
> > Yes, that should be fine, although I wonder if this is best modeled as a
> > pair of keys or a single switch? I know we have touchpad on/off but I
> > wonder if it was the best option... Probably more convenient at some
> > point if it was done through the atkbd.
> 
> EV_SW has the same problem as the drm property API. The mere presence
> of advertising a new SW_PRIVACY_SCREEN capability on an /dev/input/event#
> node would convey to userspace that there is an eprivacy-screen and we
> also would need to know the initial state (on/off) for using an EV_SW
> for this and we know neither presence nor status before hand (1).

How is this different form presence of KEY_PRIVACY_SCREEN_ON/OFF? They
also imply that there is a privacy screen.

If we really do not know if there is functionality present or not maybe
you can register a 2nd input device for the privacy switch upon
receiving the first event for it?

> 
> The real issue is that the firmware does not tell us if there is
> an eprivacy screen. As mentioned the first time we find out is when
> the eprivacy screen gets toggled on or off.
> 
> We are having similar issues with SW_TABLET_MODE which userspace
> uses to e.g. show / not show an on screen keyboard when a text
> entry field is focussed. So the mere presence of SW_TABLET_MODE
> can influence userspace without ever sending any events and we
> have all kind of special handling in various foo-laptop and
> intel-vbtn, etc. drivers for this, which I would like to avoid
> here.

Probably have a similar solution: delay registration of corresponding
input device until you know the existence/state?

> 
> So having ON / OFF EV_KEY events which we only generate when
> there is an actual eprivacy on/off event are by far the most KISS
> and fool proof solution.

This assumes you assign special meaning to it (i.e. pretend that it is
not really there until you see events).

Thanks.

-- 
Dmitry
