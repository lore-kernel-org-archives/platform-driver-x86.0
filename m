Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79051F473A
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Feb 2025 12:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740054352; cv=none; b=Z8yukOb//5tcjqypGYePltv6amuwxTwNuBZubgw3kEjJ/T+FyJTZeBsuqsdWzLm3LQSnAKvSHZsUe1nPrCtGJa1VBwf9GSKmm1VJEmoAO3CkAMogoEmBTKyNQlCHVLjphwtPAD4Iaw1FYmNXz7GAyWsC9INcVqsSmy3V+dEwznw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740054352; c=relaxed/simple;
	bh=ObMopkh5nf3fJxp3LjBl1Ml6Sd+kK9sdIbeJsEyHFb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l9ycy1N4yyCydvix7ly9xMC/wmEpo3DK20niE2j/LxfTZ+llMq72hjffYReH1P5vMwq0eXd4jYzfCxSh+hYcGWvQB4An+kdxquS/us0zhfMAepV8lbJ9c80ITkb1I/vQ8mpw7ruOnCrpnpB7ZTzEwQI2+G6viCTXGPOTmvuxMRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mYf+q1BY; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mYf+q1BY"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2fbfa8c73a6so1689882a91.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Feb 2025 04:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740054350; x=1740659150; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfNoK6QGklcF15Zq/NWUxbDwRJVUx2YVgCWKrAHQQbg=;
        b=mYf+q1BYd0UtppSrf21gLiY35rVAAtGcTM9OzAvP6EIz75NpV9S7QROcJqCdSm4XST
         TiiSquwQt6hzUejRXZd/44ccvVE4uL8881Dpwoh1sv4TDFgYayFyjyE6x9kON0UipkPQ
         hlCvnbI9Q2n44x1sdqGe7F9SO3tBHrw8emJGxQU1nKC3H1Bk33ywvMF4itErOzxqbaTx
         TxMn1ArTDrW6VXWkwDljblURaALYOv9rfVHtus6Lx7SVjTx4RfBAXvJgr5f/U9ZZtuxG
         iES6T20sL1jo4A2rhMwe0MZQo7NekGhLnjhajC5OsrxT7ZBo0aakCH7Lzi/F/dWp5tDd
         OIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740054350; x=1740659150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HfNoK6QGklcF15Zq/NWUxbDwRJVUx2YVgCWKrAHQQbg=;
        b=SSOGc9bu673P54dGDHhkHrJAO7GHOlObmf2ijnzoPB8X04Cx81996JFN+JgfevMoY7
         6mBDHdwABlgQAe6x1hFuObHJ6bcfuwBW63VPzGIPJc2QrVW0/zOETjtnCDHZ8ZyH7Ki3
         UmENOaDP4xh7K1WOELMgirQ+zjizDoxdO+7sICfUVBvM1EKGwZYpM+9kfnF2mS11/Twc
         +3JcoXKEfa3yurVuo5z3BnHT7IL+ValjLxvZ1tVEQXTuHruukHVCP2kfwz4RRSGPMzC2
         Bd0+bz36j/FvM6L2dKf0PqI/QfQywjMsYO2OOuvT570zXWmaIXBAVbkFiDpNdFThKSZu
         hcHg==
X-Forwarded-Encrypted: i=1; AJvYcCXqTC39WCkNtl2L2Z0WpIJ5B8lz6BRtSGuhwHVFurDPlv2GJeLIHTYKj22cq2IpucMKhPCZZEbQezsPZjXjfK0LR0Bm@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo8OfvMKOQVNx56LJ86kMokf2/rd9/Vo8tRdn7kScIxJzZLxJo
	Ybh6AeccJyGq7/KPN/GCnblEpA17Q1lcObQ92tIt9Umx6FieFTfUa8v5Vs4kPWYwCKxHQ+OXNPM
	lNkdFPFrs/Aed8XQR7inYfbkwfN59hT6r
X-Gm-Gg: ASbGncsFnZfBobkr0Y7GyJvwWVPcPmy7K30kIQX+JWGiCxZrEtX2n7FxxRyrbDZak6V
	iXG8peBPgOF1843VjJzCYVbQNwUKJVSP0JGP7Byom5V8UuhYZSqM24eGY+0cT82SmBxAsDNjujQ
	==
X-Google-Smtp-Source: AGHT+IERLZtW7EqmlkqVfdTxKKlKbRwf5+fZMoMtSLrE6YY9XWK0l75KGNXk+PoJh/UDVuvOfo/uPkSlBRlnJHXBMNs=
X-Received: by 2002:a17:90b:3a84:b0:2fa:17dd:6afa with SMTP id
 98e67ed59e1d1-2fc40f21e37mr38505096a91.17.1740054349862; Thu, 20 Feb 2025
 04:25:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231010172037.611063-3-teackot@gmail.com> <20231010172037.611063-7-teackot@gmail.com>
 <974c5-8032-28e0-fd2f-9fbc9d413e4b@linux.intel.com> <c447f107-df52-92d1-fdd3-96b76860621e@redhat.com>
 <72d7f17d-25a6-dc6-453a-af553ae2349@linux.intel.com> <52c170f7-92fe-b814-1587-ffba3c82ec43@redhat.com>
In-Reply-To: <52c170f7-92fe-b814-1587-ffba3c82ec43@redhat.com>
From: N K <teackot@gmail.com>
Date: Thu, 20 Feb 2025 15:25:38 +0300
X-Gm-Features: AWEUYZn54_vhRUeTPbRmOMzNV1xceI6rqUOVwh7cTA6BT4My56Si6VLvyZMktWA
Message-ID: <CAPXvF07Nh4dgxF57jVxuOit=MPoX1-mNWvbey61HGt+UB065AQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] platform/x86: msi-ec: Add fw version and release date attributes
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, Aakash Singh <mail@singhaakash.dev>, 
	Jose Angel Pastrana <japp0005@red.ujaen.es>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Oct 18, 2023 at 5:34=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi,
>
> On 10/12/23 14:56, Ilpo J=C3=A4rvinen wrote:
> > Hi Hans,
> >
> > You missed the one question I had for you. I put it now conviniently at
> > the end of the quote block below...
> >
> > On Thu, 12 Oct 2023, Hans de Goede wrote:
> >>
> >> Great to see that you are working on upstreaming more of the
> >> out-of-tree msi-ec functionality. Thank you for working on this.
> >>
> >> On 10/11/23 14:41, Ilpo J=C3=A4rvinen wrote:
> >>> On Tue, 10 Oct 2023, Nikita Kravets wrote:
> >>>
> >>>> Create a root attribute group and add the first platform device
> >>>> attributes: firmware version and firmware release date. Firmware
> >>>> version attribute uses an already present ec_get_firmware_version()
> >>>> function. Both features are present on all supported laptops.
> >>>>
> >>>> Cc: Aakash Singh <mail@singhaakash.dev>
> >>>> Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>
> >>>> Signed-off-by: Nikita Kravets <teackot@gmail.com>
> >>>> ---
> >
> >>>> +static ssize_t fw_release_date_show(struct device *device,
> >>>> +                              struct device_attribute *attr, char *=
buf)
> >>>> +{
> >>>> +  u8 rdate[MSI_EC_FW_DATE_LENGTH + 1];
> >>>> +  u8 rtime[MSI_EC_FW_TIME_LENGTH + 1];
> >>>> +  int result;
> >>>> +  int year, month, day, hour, minute, second;
> >>>> +
> >>>> +  memset(rdate, 0, MSI_EC_FW_DATE_LENGTH + 1);
> >>>
> >>> sizeof(*rdate) is safer so please use it.
> >>>
> >>>> +  result =3D ec_read_seq(MSI_EC_FW_DATE_ADDRESS,
> >>>> +                       rdate,
> >>>> +                       MSI_EC_FW_DATE_LENGTH);
> >>>> +  if (result < 0)
> >>>> +          return result;
> >>>> +
> >>>> +  result =3D sscanf(rdate, "%02d%02d%04d", &month, &day, &year);
> >>>
> >>> There fields would naturally be %u and unsigned but see the other com=
ment
> >>> below before doing this change.
> >>>
> >>>> +  if (result !=3D 3)
> >>>> +          return -EINVAL;
> >>>
> >>> EINVAL should be returned if the input was invalid but here the data
> >>> itself is not okay so some other errno would be better.
> >>>
> >>>> +  memset(rtime, 0, MSI_EC_FW_TIME_LENGTH + 1);
> >>>
> >>> sizeof() like above.
> >>>
> >>>> +  result =3D ec_read_seq(MSI_EC_FW_TIME_ADDRESS,
> >>>> +                       rtime,
> >>>> +                       MSI_EC_FW_TIME_LENGTH);
> >>>> +  if (result < 0)
> >>>> +          return result;
> >>>> +
> >>>> +  result =3D sscanf(rtime, "%02d:%02d:%02d", &hour, &minute, &secon=
d);
> >>>> +  if (result !=3D 3)
> >>>> +          return -EINVAL;
> >>>
> >>> Ditto.
> >>>
> >>>> +
> >>>> +  return sysfs_emit(buf, "%04d/%02d/%02d %02d:%02d:%02d\n", year, m=
onth, day,
> >>>> +                    hour, minute, second);
> >>>
> >>> It would be kind of nice to use %pt formatting here instead of custom
> >>> datetime format, however, it would either require converting to time6=
4_t
> >>> or using struct rtc_time. The latter would naturally have the right f=
ields
> >>> but they're not unsigned so my comment above about %u is not going to=
 work
> >>> well with it.
> >>>
> >>> I'm also a bit unsure whether it's appropriate to use that struct out=
side
> >>> of rtc realm. vsprintf.c seems to convert time64_t into rtc_time befo=
re
> >>> printing though.
> >>>
> >>> Hans, do you have any idea about the struct rtc_time?
>
> I don't really have any good ideas how to handle this. I agree that
> using %pt might be a good idea, but then as you say the data would first
> need to be converted to a struct rtc_time. All in all I think it is
> probably best to stick with the DIY formatting of the time.
> But I've no objections to doing the rtc_time conversion if people
> think that is cleaner / better.

I am working on this set of patches again, and I think using %pt and rtc_ti=
me
would be a little cleaner because rtc_time has all the required fields.
I noticed that vsprintf.c doesn't use the tm_yday and tm_wday fields,
however, is it safe to ignore them and assume they won't be used in the fut=
ure?
If not, having to calculate them will probably make the code worse.

Regards,
Nikita
