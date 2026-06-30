Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3C2243367
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2026 20:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782851895; cv=pass; b=LeFeZRvNpp3rrgWHnDcfW8E6wbQzPz62h+pubzRIU7XgGvf0fT7KQ0SUICE3QP/Cu4seZf967rp2GlkneVmM8YJm06Ue8+DvOwsEiicIHCWrDw6nu3cOfL5vMurlkOdTr/SX/cFegRqS6+RHgU67BHsp+qznYyW5WwX7HC1pyUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782851895; c=relaxed/simple;
	bh=Ix8HXASjUjTrTHEpQ9w6PTGFvH/+n2owsTEvJrx3U0c=;
	h=In-Reply-To:References:MIME-Version:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FUJ6QLyakW/ChBIjn4vhwsq5gColJpGjDo5slvWdFcd+bkhT1e9gWr/a4OQ/RmI3Mk5RWe5ZFRawWzSrEqOD9FoWJvSKW4VLAvtEhAqkNXwU52Bf5bQ5lWYnLrC5l8fIHmT24mBI1eJ0DcGiYoRbutq2AtHZQSd6uQyAQ2+18O8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=McNAVB+R; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McNAVB+R"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-80e2cfe6918so22599787b3.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2026 13:38:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782851893; cv=none;
        d=google.com; s=arc-20260327;
        b=GXvIou5eqdB8Ahbub15ynTX/rQlHZLXsq0BtdF/00oVs4OQ5zedxLJeAxuM7Oa2BPr
         UeYOzo33/xx5WmPZro74f9z1rv0vdHn73g5MVf66nfHXHgAbI4AONIN6VMJq5nN0ZaDV
         sWDKxeKX+n9HWhRXo4eyJa+D0GogFdn2o23QfIKbiw4CvGNm77b2EbfpzAuQRCFrw284
         Jnc/u3v9qqgfjMqO+xo94eaiP8irifvWT4vhYea3WqWhzmRpESljP5h7JK7cqlF3euIk
         oTiVZvwUPwwvPah6itiDF5jq4r30RSEkDVm26EsmkcwZB+hOP1rL14ll7E3GP9aj6fGA
         dE6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:references:in-reply-to:dkim-signature;
        bh=Ix8HXASjUjTrTHEpQ9w6PTGFvH/+n2owsTEvJrx3U0c=;
        fh=gjYx8WiKpchzTG8zzyKPaw7kQj84vGUIBgAbzKJCHwg=;
        b=HKEo5nmxgkYVRsuuBcP6Ceyeaxe1dtb/Xkgk3ARzzZ8Ny4sFVIW48qpkfG3LIXvbtc
         KbyGPjrln/cyKfwsdMYrz9t/lS+vdJLMFe197qdR+sXiVKeOd5omAGp374zlzAkiA0li
         rk+N4xxCyFAnLqR2oFezBVTx4aThsIkiFKaRsZX9ecIX5Y5V3E5Ad158jLicANZSCnxM
         PLL5Di8WXKaq0xdk5lxwcP2gBXUYrISssx0BN1vvsNksvVCUoNbZuxkP+S1m3UrGlouA
         +DnKi47JhGX22yNiHH74QCUQ/5z35+7JtiTUW4sCToQW5m01N1/mmykPOS4M30VfZqnf
         tVHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782851893; x=1783456693; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:references:in-reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ix8HXASjUjTrTHEpQ9w6PTGFvH/+n2owsTEvJrx3U0c=;
        b=McNAVB+R5cO9GQ3quFJplOwDC6nzxEeNOkdSnwExcIEol8pJIdAQi7HuCPIDdgUDkl
         bK2PfITWZgrCbSi7UqMR5a9Zn6thXkeqoVtkpX6/6ZUKJ6IqU8YoNzee3AjkVcdlvRCt
         O+N7R0mp21qhnfan0TA3mZz2eWQHE79tBKUqxlA9b3ids75ZTVL5aE4cmyiuDpcIMPXC
         GZcg7GO3CTEiz3e6FmGBxJQ1EoKVX4dR+KGQ7mvVInSxTL61uosRYjIqK0MCK3lMHKCl
         OrdDUIFgKsPVbY1m7xvQ8SGn2PIkUp53CSVEL/QPgAOAlliqL8eMRgBDCz7qq4SC9yed
         a8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782851893; x=1783456693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:references:in-reply-to:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ix8HXASjUjTrTHEpQ9w6PTGFvH/+n2owsTEvJrx3U0c=;
        b=c7sa6R3+O4Q+pRBdJK6d1ZCXeoVF6HWA52WiXyb0uzDB2FANdQIQU+E8DezhNcm9re
         Y1nsZ2qqvxXpkc4EyiiJBfwwrHBodCxMeeUJjzXUz+ALePpewjSv8X1zQrJYuJEyNHx1
         oHY8LuL5tkAyb1n/LARc6b4HXX+jLuMKU6v4of33KBAI9DVy75iJHjJXQL+a1kKhL/PJ
         +YXyYsdr2AhEPx7yw3Fi9y8MUNeBNUsyTSsdEKmEqr1r+AnhBUnMSy3D8Drq1aqweBkp
         PNNAycnlNMVTyDd3mSg1cZCk7OWa0t7IFgJChr7PmMQVuICuMPzaNtUSoY+jq/7qybor
         8w6g==
X-Forwarded-Encrypted: i=1; AHgh+Rq6Gjp/0+F8920cMwNXtrmfk/A34uq6YQuK4DzhBuGAsJwFk9bIywUA0Hy6pF0XhY9sDxEucxCtqWDcp7BnggTkXiLR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+BoD4awH2V7F7KUzb6MPFt0yDyhHEfcbXEa3t1dyFOuSwYDNd
	PjRt3ho/Bj+bzUb8hH8P3ozLbZuX/WH/1fA+BmExJcPl7cLqfY9SWdz3C/OKvQPNtqzGb+tnMcg
	3JsXvkACYmPD3N/Z/WyAvx6MPysMuz1i++IbV
X-Gm-Gg: AfdE7clhv2mxVCXad/3z9HhNHIDEHVCeIv6ihJORirQvHBzcOIm1UNntL5hgwDSo6S5
	v+jHSLhdoce9Idew3jOmRZIVekySrcJRFdylzQTIvHMLZ/jmkPrTPKZ8iQjt5tY189YcNPqMq+i
	vMleZhvEf7iuQohjl2yx21bTzQ1TJVk9jrvFxBkuJ5y/Gs2QOTIE0Bbl6uCdALxOYbhaPh1Y2zN
	9rWYFDJxGiIXQejxGMJvOpRor5xQmpCmRVQZlbRVsfJPZgKZkcKb4PBOLjGgOGNYdP2TgC2
X-Received: by 2002:a05:690c:6c02:b0:80c:85c6:897e with SMTP id
 00721157ae682-810da811a36mr62591247b3.61.1782851892933; Tue, 30 Jun 2026
 13:38:12 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 30 Jun 2026 13:38:12 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 30 Jun 2026 13:38:12 -0700
In-Reply-To: <706918ff-7ec8-4288-9fc6-8ad759feee23@gmx.de>
References: <20260630105033.53967-1-alhouseenyousef@gmail.com> <706918ff-7ec8-4288-9fc6-8ad759feee23@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
Date: Tue, 30 Jun 2026 13:38:12 -0700
X-Gm-Features: AVVi8CcfkdqTNFbsijPVvvOoo80wkiIbi5AR2COweBNVL6WZBIHrRY10LmNVaqQ
Message-ID: <CAMuQ4bVWeP5ZP7hH_6w2cOab-A0e-zwRC59yA3S+UDkUctUoTw@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: acer-wmi: reject missing gaming WMI results
To: W_Armin@gmx.de
Cc: jlee@suse.com, ilpo.jarvinen@linux.intel.com, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, Armin. That interpretation makes sense. I=E2=80=99ll preserve NULL =
as
the output-ignore case and only reject a missing object when the
caller supplied an output pointer in v2.

On Tue, 30 Jun 2026 22:16:43 +0200, Armin Wolf <W_Armin@gmx.de> wrote:
> Am 30.06.26 um 12:50 schrieb Yousef Alhouseen:
>
> > WMI_gaming_execute_u32_u64() returns success when firmware supplies
> > no output object, leaving the caller output untouched. Gaming getters
> > then inspect an uninitialized result value.
> >
> > Return -ENOMSG for a missing object and -EINVAL for a missing output
> > pointer, matching the existing malformed-result handling.
>
> Good catch, but i suspect that the original intention for checking "out"
> was to enable callers to ignore any output values by passing "out" as NUL=
L.
>
> Please only return an error if obj is NULL _and_ out is not NULL.
>
> Thanks,
> Armin Wolf
>
> > Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> > ---
> > drivers/platform/x86/acer-wmi.c | 6 +++++-
> > 1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/ace=
r-wmi.c
> > index e0eaaefb13d0..81d354c80cd2 100644
> > --- a/drivers/platform/x86/acer-wmi.c
> > +++ b/drivers/platform/x86/acer-wmi.c
> > @@ -1581,7 +1581,11 @@ static int WMI_gaming_execute_u32_u64(u32 method=
_id, u32 in, u64 *out)
> > return -EIO;
> >
> > obj =3D result.pointer;
> > - if (obj && out) {
> > + if (!obj) {
> > + ret =3D -ENOMSG;
> > + } else if (!out) {
> > + ret =3D -EINVAL;
> > + } else {
> > switch (obj->type) {
> > case ACPI_TYPE_INTEGER:
> > *out =3D obj->integer.value;
