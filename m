Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2A9347FC8
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 21:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771448694; cv=none; b=Hcurc1xI9F6g60ImIWnhO7CliSVmgC/O49J7XAMe6YiDpshAKAAuz3CuQ8D8zE7VgxzGwa6ZdRFQDRA86MX5J7jIQHA2R4dLpjaTdPl4b4vOYJ3nXYka67qj+F24+EWFUx1JM+nTsln3GiL0uLBPYhnOYCByyKqIy/+s95rJr7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771448694; c=relaxed/simple;
	bh=HplSw9dy/qWgqPqX1mcyfcb4JSrW1j9OaR/ZWiFzi78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5qKHMqtyfx36iw6V1UsY2+YWZnbC/uUsiS6NGFR294cZqSHtRgNz130k97idfQK73mVpC3Q7w2NlEZ2oczvVu3STrZPx9wwAcE7mUMptAV29TpZb2SR9wm+63Zsgm8w2jcxz7FUy6o1+YBF9YgU+ktmDwIgDgulc2nH7cO3trI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLvAQE7Y; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLvAQE7Y"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12732165d1eso236233c88.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 13:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771448692; x=1772053492; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IjjayYR1g8KtZVuRZH/Ka4VPUUbcT2/C4S4r4Kniljo=;
        b=FLvAQE7YaKPY9+/XhhBqtsLvWBL/JIkbKEMfbC5jasmki/qFsBQ4YXkC//p+rhWmB9
         mLS0eYTahO8QjAiM2RtmjHrSEEdNFigSXC6RO6XHRZcin2+mR2/+ewrZkbBQHDztmlwS
         akfNezAQIh9PoNW6P9QMdtTgWwN4oirN7pnbkv9+OzrXlU+J6oibx4aTQSNYIQwiz4ib
         iHmGVpzcb5dbuAXAcWEU/x8Yp63NnNm8o7Whkg6EWfc28yiSnmtnf0xviThckH5qUfzR
         gwV4u+poHUPwWaac4VZdJZCZnYdi4qKN70AtoSX0M9ZIGDtmjknUMFGBw1DN/FdfW7U8
         JHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771448692; x=1772053492;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IjjayYR1g8KtZVuRZH/Ka4VPUUbcT2/C4S4r4Kniljo=;
        b=ubvCIja/ixFTMhchuo3E52Vk7xwKPlROF7V/1B7W/Tb0RdII6yHCROUYbBXYrpEOYY
         GI8AqqecsvqoWojncoJEaAYS3jCoQtlbCqzuQRsHFnPLoMv7TE/isU7bKqrKmGVcOEF/
         WnWweqNW82nXDDERqALHbuWRS0aXYqIpq9L4Qv0I9RO3u0ObC+vHdOlDJDOXHHvByevB
         POioqKcx7GG295waXICLQa2TspFlNMzzs9UnuzEKhskUoRzJHbVpQQuqgCWeY8h1IUaL
         oRYafWPdw/IcXVF7d5U3mUocAoAaNGoFE4YRh0ks4LTvoiM+AwV30qZKBmYzswiAnrny
         xoxg==
X-Forwarded-Encrypted: i=1; AJvYcCW0zo6YNAsxnOixDdEhdjb8o4l0ICPmIUw5/VOXSW8vzJhD1HYJSr6vXNUYlMQ89ZhpqEefWLMFXfhrmobmVnIWGB1U@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd1Ia1evRopsmULRGzkozbObf6V5ATb6eG5iFKatgPuk574SzF
	KeRV4UUhA5vfgYoIxVYlIptD1XSJ0gXQdGS9oTIbibhv3FJQ60tNMryr
X-Gm-Gg: AZuq6aK+4cTdQNsccDyvm+UV8c1pYP/cr2zNoHyctPW4Ajo4aQUmgJgd0vera83fsUB
	o+i3dIsg1D+eRZ6zhGpPk/xwPmLl+KB3i1eamHibsQYNou97SfXB1larjME3OJAB3UQVFj2gxQF
	Zo+fvzuMra4q2RAI6KafhPstU5bhMo+SQxo09XUR689iPdwxsqTzxjSd+SURtp9zCZUnpoMSG3A
	Oy/sznlEOdgUtyn0VYsf6OYAAFSMy4JVSeJq2p9lZ+6psPPsMcghZdAGdk+vOij3wwf0YfqLtdt
	9I48SfnWXEyGPe3uc6948RPDEFIsBwpjDMW44Cqgp1ZEZAE0koRJ6b9HAheJCm3+sV+WcgQVjwB
	ZYifjbqRP+nZ6vALg3yRY2SD8Oz39cimkSz7byEC0V+tOSVZXrkOflg2l3XCtz/JjK+AA6ZI0Qh
	lYr6TKUaSlRM+ycL5s3MeWtrMlZ3+KqKQF3uT63lRUwRwiUV1vbS+pMMJybvLWBdNt
X-Received: by 2002:a05:7022:51b:b0:127:15cd:9f52 with SMTP id a92af1059eb24-12759a0482dmr1521312c88.5.1771448691865;
        Wed, 18 Feb 2026 13:04:51 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:265b:f5ad:9e03:677e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c63feesm24214274c88.4.2026.02.18.13.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 13:04:51 -0800 (PST)
Date: Wed, 18 Feb 2026 13:04:48 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Tj <tj.iam.tj@proton.me>, 
	Hans de Goede <hansg@kernel.org>, metux IT consult <info@metux.net>, 
	platform-driver-x86@vger.kernel.org
Subject: Re: pcengines_apuv2: LEDs/Input fails since v6.18
Message-ID: <aZYpArgUKvxtibzS@google.com>
References: <b553243c-9ec6-4016-9fd6-d33f549a3dad@proton.me>
 <ef96006e-ca94-4525-9727-4a6011fde7e1@kernel.org>
 <54082217-0eff-49f6-b4f1-0daed58c2568@proton.me>
 <aZSkqGTqMp_57qC7@google.com>
 <CAMRc=Mfd1dD7XL4smPtRTVD8vhGR=PmLLcNz2t1Q8+jwKbm5Mg@mail.gmail.com>
 <aZX0EynAKvqXWzq2@google.com>
 <CAMRc=Md3kUVOEshvPiwv=xvRRNwQndcP=hsbyMOJn4c2=+CaiA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Md3kUVOEshvPiwv=xvRRNwQndcP=hsbyMOJn4c2=+CaiA@mail.gmail.com>

On Wed, Feb 18, 2026 at 09:21:14PM +0100, Bartosz Golaszewski wrote:
> On Wed, Feb 18, 2026 at 6:25 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > > >
> > > > I think the patch below should fix it.
> > > >
> > > > Bartosz, I think you should revert
> > > > 86ef402d805d606a10e6da8e5a64a51f6f5fb7e2 until after you audit all
> > > > existing gpio drivers. Breakign the kernel like that is not great.
> > > >
> > >
> > > Hi Dmitry!
> > >
> > > This change has been upstream for close to a year - it first appeared
> > > in v6.15-rc1. There have been very few reports (I think a couple
> > > initially and then none for months) and fixing this is typically
> > > trivial. It addressed an actual problem where these retvals would be
> > > propagated to user-space and misinterpreted. I think we should fix
> > > this driver and keep this change. "Auditing" typically means never
> > > fixing things entirely.
> >
> > [+LinusW as co-maintainer]
> >
> > That's ... an interesting stance. You couldn't even bother going
> > through your own subsystem before applying a change that could break
> > user's systems.
> >
> 
> My stance is that I don't want a knee-jerk reaction of reverting a
> valid change after one report (with a fix queued) several months after
> the change was made. If more people start complaining then I won't
> oppose a revert.

I think you are witnessing that outside of "common" x86 devices there is
significant lag between the latest kernel release and what people are
actually using on their systems.

Thanks.

-- 
Dmitry
