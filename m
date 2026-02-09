Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2D238885B
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 17:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770657928; cv=none; b=P0bLian7gL46hCHf+mYc0XFmNNBHVMrLUmqTWFj2iM2ywRw4mCp33lTf9oGBIIJEQ6rWe001SB2arymKzRnNwvDZAprvlqtUOEdoURIIl0J9nIkJvvgF1Wr2M3Qspz6gz4Vz48SGG9WuSvY7VVnDQVFH8IEo4ZT1Fl+iUClSdx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770657928; c=relaxed/simple;
	bh=U9Kh+t2RE9PaZaBFDqpNRRR5hQM/8hzeBNwk/y2tzDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iISH3ilHfkwOitZ6zfKJYhCxb+wKMKtDomjhe+g7cNhi1KKtO7yMyMlMwKmfROGrHQxeeKe5oLM+oZVRkF9yrhxgyh6EFFL1HBL8Ig1bjzDNM7th7Hn6U8+yufsiyOS7EvY6XGejROkKnTRrV2+0gQZBylvj3MjJ+OzYh/EXZn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NG+exc7e; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NG+exc7e"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b81ebac5d6so5326007eec.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Feb 2026 09:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770657927; x=1771262727; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UPHwJ5kgihjSVqArGftYypBN3IA02myECdF8eRwc5kU=;
        b=NG+exc7e0ovCHhCBwIijUwLFMCjgFL9RyIWw2HJYiRAjryOaWZ5UEnnPbcj/SSvBmh
         RBccxmW/ceihfaJQ2Kcx15rF+T4ZBubKVkVWyH3y78ENTvFpuOvDjRDY+3GdHCjV5fhW
         mfmqRdiJ0UEUOd2CzFiBoTT4Ohsyo2bdUCbzSaU9FzI2cOwA/lfYu4kzkpgs6BYckRVQ
         Wbwt9ZkwOIoSYRT2sMkXZsNMkfnDz6YJphcvd1HyJ10H3SbcvCEYPnZxZ68/3c/+FGOy
         Q8ZFe4JRhmBKVqgHtXTJ5BP4mpykAvsk0JJOAvCBgZq6ivvb/6wA4I9nfaSRXKloQrBA
         4Ceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770657927; x=1771262727;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UPHwJ5kgihjSVqArGftYypBN3IA02myECdF8eRwc5kU=;
        b=nv8qs+pF35gCysP1a1u/U0A8goLjo7ZtGihNB+pcMFoPXcslFnykorzpNwp1vLfiFg
         fk4MPSi53U8M2unO1Yq4EOVxfNKuRSs2RYmQHxTA1kqnOXSlSfUquZa3TS2ZnkBug8zK
         iO3GNeoy+AdXqQSdH1+gYDcfC4XY+OgAd2ULnldr6m1EozazXwXa2er0KIJkc09SoDrD
         aqWUPRmpZwzNQDv7KSCeOaXPJFyXPIIPUk5RHCQv6tH+fzdWAHbO9Vt33KlO7EurNa5E
         lYUOkkDXgej1PYj0rrreZPAxJmlPcJuewS6zXuUJer+9QEBIxupr/eoSurtsLzeGjDUZ
         NK+g==
X-Forwarded-Encrypted: i=1; AJvYcCW75rhLW9jcLHlxVHqVF02FzvV31r5o//BFz8XMlLXTIBZ+RtU+Y8G5F4ha5lvjDuyJIMGNZx0nEmGEP1oayUc+pcka@vger.kernel.org
X-Gm-Message-State: AOJu0YwL742Jr2Y0h+TzQYhRfmvb+YMUeDEH9ssNLA8qLh/r9JI/KxHJ
	snpaOzz1e0qrs5X/6nQQS66rK1eT1tWgGY9HzWzmXoPI9rDcWvgPxArt
X-Gm-Gg: AZuq6aKZuO1qiHLG7NukiuZolq8H/y9mUQ802WXsbqTmlG6I9KSupAbun3Bd2oS29ek
	Suc1/kjYBZLJZJGoFXtyAPBurfJpw1gSONPmtZetktI1O4jLiHlmkbDPY3N10ef7nWQiTt8QsUJ
	wvW46rv9ZliKUov6grdoe6IUqHCttJw7VDUxNpTHNCDPYmjrNhlmSiFNfMziJOBcNQenb+Btg6v
	PQFbPZlonje0rJOovIX8NPH8AuGjn8bfipW2ENIYSWVwinSBUvxh5JE5bHAkKBcVysYUlWskbwH
	pQ+HGM8QGypHALtZDQDFIGbIH2Lhav/QeJKl4grFNyofHefE+sEMAAiQ0AuARuMs3K8HF0QJI96
	AWWsxD1+KmhB+Wi1hM4x2/4mm15g0hmLdq5lUXs2LrSh2KYn2XCODSXU+KjMok8hBL88ovr67Mc
	OWfJwJKnYEM+DNh9+ng7R1SgnBZ67RO6Ot2zqe+gJDGU5vLqC3dg==
X-Received: by 2002:a05:7301:22a9:b0:2ae:579d:2038 with SMTP id 5a478bee46e88-2b85645ef98mr4244772eec.4.1770657927058;
        Mon, 09 Feb 2026 09:25:27 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:d70d:15:1011:7b14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba6517c316sm4055926eec.3.2026.02.09.09.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 09:25:26 -0800 (PST)
Date: Mon, 9 Feb 2026 09:25:24 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Arnd Bergmann <arnd@kernel.org>, platform-driver-x86@vger.kernel.org, 
	Yauhen Kharuzhy <jekhor@gmail.com>, Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
Message-ID: <aYoYKcNY_IcEAuNV@google.com>
References: <20250920200713.20193-2-hansg@kernel.org>
 <aYkdKfP5fg6iywgr@jekhomev>
 <aYmV5Axyfo76D19T@smile.fi.intel.com>
 <CAMRc=MeouZAkuzynwUnZd-VsZq1nyEgbv-Bt6tNMXosApF7RDg@mail.gmail.com>
 <a285a632-4a3a-48f8-a34a-db595fa0e477@kernel.org>
 <CAMRc=MfMw85D3FoX0ckAxgEyY8D3ZK5uf9sgVXg7_f+mE55dRg@mail.gmail.com>
 <aYnycxR8nxu85Ivd@google.com>
 <CAMRc=McMOMYnGhsZS2OSeXhMcJPKnjSku2v97uAgatwEpZt0zQ@mail.gmail.com>
 <aYoNUn8i1avcZLst@google.com>
 <CAMRc=MeQyTJ4wsiU-xkQr+wh_w2JPCz6-e6Koy46cCLsngET_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeQyTJ4wsiU-xkQr+wh_w2JPCz6-e6Koy46cCLsngET_A@mail.gmail.com>

On Mon, Feb 09, 2026 at 05:45:55PM +0100, Bartosz Golaszewski wrote:
> On Mon, Feb 9, 2026 at 5:40 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > > >
> > > > How do you do that when your code happens to run first, before the
> > > > controller is instantiated? gpio_device_find_by_label() will not
> > > > find it, so what will you use as fwnode in that case?
> > > >
> > >
> > > The device that calls gpio_device_find_by_label() (most likely a "real"
> > > device with an OF or ACPI node) should return -EPROBE_DEFER if that's the
> > > case and not create children with software nodes.
> >
> > There is no real OF or ACPI node in case of old legacy boards that have
> > not been converted to device tree. In many cases there is not even a
> > device that you can defer a probe for, and returning random errors
> > will likely cause the boot to fail.
> >
> 
> Then I believe such board files should have never been converted to
> (fake) software nodes because what is the advantage of them over
> time-proven and well tested lookup tables if all we're doing is
> comparing strings?

As I mentioned in the other subthread - to be able to use static
property entries to describe the rest of the setup and being able to
drop support for bespoke platform data from the generic drivers. 

Thanks.

-- 
Dmitry
