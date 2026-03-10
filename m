Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96F42D73B9
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Mar 2026 01:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773106686; cv=pass; b=agolr1LpocN1aD0DHHjVrYetEb2zs++Knhv8IxQgjuN696mw9xKazd2ibDPgHvIfplUWEIZ2/+lvmeAOVRF02qUMS533zgJ5qDQUViBrMWFtzPKmmtuHZJujd4ConK8rbeWloP/cF+vwSs77XRbzSRLLvmFrBivAGkCs7vDRHYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773106686; c=relaxed/simple;
	bh=hYFb+CHAPoD+FxG1b0ogsBVr7QuNFxqc1woQT268nfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z0Vz3GcgCm5LAz+HCE8jT1Rkl7UZtzGWnoGQ7jGwkj05Gcu7N7tpSUZHz6A/iwPVvik9G7qI4JKvqQntqAxcz8gtZrbWs2fndy0NcXK5FHZdEDWxN+n8fEsmsK/BgoVqRvg/MXSH2+7389IN7FDX1reH5g8HEQBFM6TSpItehv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g4aEi+oo; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4aEi+oo"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a13d6a2d7bso3163504e87.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Mar 2026 18:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773106682; cv=none;
        d=google.com; s=arc-20240605;
        b=bB/5tmoOl/c6YhC/uMG38AQjL3wOrJ+8aNbeBX/REv0lAvsUP3my+BVQi9Dg+5SYBn
         vopjjf5Jut7adibTQS4YArfLncBjRjv/hw6Ohb5XnQh4qrGlfxE4s7U2zLKMZCBs2zBY
         ue7e48TC0wf/GSUaQqMWenay90KBWJNZpiB7ngLbGJBBjRU8LPxjtwbgyA4CLRMtn9Fd
         pfulfhmgpr9uH3wdoyewS7X0ssd3Nf+559t32fGfxxwwkWZDjUW3UO3LNVvFx0xoMlVE
         bxYZ3whEhGWPfZgV2tAMWuJDP16GJ2/37BspVGARJtzZs4LNuKfz90WVU2QDHAy9IyVF
         AjVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5JD0I3h+Bg6710KUeP09U+MH0kWId3jo7xnuY4+fPZk=;
        fh=jyIZ5AiAAC+bX+y29hw/v4/XLR9CNRu2UXHXETgVyq8=;
        b=Cu+tKHDqNlbhn5wWUDzAQJLC+DCWZOqNnwTd6ZqA57Z4leGIggiaJLx1pgirewnyc4
         79ZRaG7nOqBHf5pFRiKYoIEDiEMC0PGiCeMrwd5oyvIe6lo/qerWt6tU4YKUyt1SnQvH
         vhV1DsBstWJszOvg0cwVsPydbZIU5rr/qaK8/lOoIGcCD4RiD622srTBViblMPi9k9Vt
         t6oWTNqzDTvWfqwrMOl19tB0/zNQ7IE8u+mq0WOxrvSsgUmcV4Mk410/FAp+0GZlUPcK
         sFzt3/DyQZyz0t4p16V+mk4Sfa3cPB+M6snBHnXr7F6igpibqBa8CKzAlwUrt9Iyt4PY
         tzkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773106682; x=1773711482; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JD0I3h+Bg6710KUeP09U+MH0kWId3jo7xnuY4+fPZk=;
        b=g4aEi+oox/IZ4wgYJwBPu4j2bwQdlaV3Dxu26cJBM+bQ7FtnKBxZSVJjMbXYqwZCUK
         XBdV9QlSiTgD0D7zk+k6HdhlgB0Dk42lvcH5NJPImRUFr56cHZnH7lPz8iGPRN43hTQA
         7QQTVEyUm7nPHOta9ZIPvKLvSQ/bwydjHyQgqJ1dsCid/pUnSnbgwqZdBu834QwRRW3l
         4TzDwaR3ypktosXCk3JWmNVGiIiyDTeGI5gDsnlLm3Icn8dSja4RcBXQIBewp6EumuI0
         QRAaMRAMEPBe9D1JsXkFDPBYWGEIx+F12iMZPAcXJtxBjMHXcmLTinFm2NOVi9jYNttd
         mhhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773106682; x=1773711482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5JD0I3h+Bg6710KUeP09U+MH0kWId3jo7xnuY4+fPZk=;
        b=MT3HhzJYptVvsKqsXoURTjbGgtIhTs8d0Fq7RGcb5NovkHVmUK0XH2utjK7TbjTUyF
         xhxbq2kDIc/yfY530Qh5kd9x+b3+VnDUhIxbN5puXF1nrH610Xf/YbpWT/JMVbvzI3V2
         jL6Er/ieitihrKBLxd8FD3wJXtDqYJ8i0lpYxjEB9AU1b/taJ399UnJeOzy3Ywv7/R5N
         4O2IRibzj6tCLVQDNSysDRxHpuLW3n58PjYUm0HUAEMHu59i8BOi5hCB+NT/r0NqWHLQ
         TEldrjtoBp4gWm1L8uJ+JxTNdS21vGK6ANToogcF+GcNdJ86NPnma4kPix2ciywRHS2/
         Phqw==
X-Forwarded-Encrypted: i=1; AJvYcCUbWfEqd1SlDNM0L0MrrhbH4Wt3B4gud9lwB0mHGb/OOpf2jGdOHXzi0d5k2FC/Vn5QtPaPxyGCBOUrrQT70Ha66/by@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6eAngGkIaMxoPfuncMJMproiVsavn61sp7ROhCvuBHfT/2Jk1
	bic6cH8D/hrnzepF6ujL7Ag6iujjyrcMmiR28mFx3AmnBXh4p8zD5czQHFGvpkfHp5zxeMP27mc
	U1ffw9lO4wOhZOjzNSAWT8KaBKrk6TQ4=
X-Gm-Gg: ATEYQzyhXxXzYdLuRY4HuzooGusqj5KJfqFltcTEsBiXkbgVyKO5y+DIQ0bTiI7IKDb
	hP6+WP1kvFmCuBBwLgqagreK07a4vRk7trweeb+UDyqzAHoQ+RwlsEua/C4LQf3gwlKHbxbUc5x
	7Yj7bV+6TCInKIpeMPeAb20VZNg3sQK29ifbFCq67Di9J4OLOIhflNjhlyuzMQcldDhWi5ayg8E
	f0pZDPmhQXfkKVGgeVZY+I9L2zQP6iVKSQ1JNBgp9wTSGR+kd4MH0kk53Oqvnj6zC94mmHMzqgj
	Pcum
X-Received: by 2002:a05:6512:1193:b0:5a1:3561:c6b0 with SMTP id
 2adb3069b0e04-5a14e46db0dmr517828e87.7.1773106681940; Mon, 09 Mar 2026
 18:38:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209063355.491189-1-vishnuocv@gmail.com> <20260209063355.491189-4-vishnuocv@gmail.com>
 <991f8a08-7c5d-5611-7904-6c5d336a74a3@linux.intel.com>
In-Reply-To: <991f8a08-7c5d-5611-7904-6c5d336a74a3@linux.intel.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Tue, 10 Mar 2026 10:37:25 +0900
X-Gm-Features: AaiRm53P8wNeC2Lcw33Sa12VDuTovyX96CkTJT3bZYRAkHoVY2iDwuco_s3ogyU
Message-ID: <CABxCQKuojiPhY1J5XSEfiMaZFjKQLk14+n9TV05egzeWMQic0g@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] Documentation: thinkpad-acpi - Document
 doubletap_enable attribute
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, dmitry.torokhov@gmail.com, hmh@hmh.eng.br, 
	Hans de Goede <hansg@kernel.org>, corbet@lwn.net, derekjohn.clark@gmail.com, 
	linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	ibm-acpi-devel@lists.sourceforge.net, linux-doc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ilpo,

Thank you for the review comments.

On Mon, Mar 9, 2026 at 5:04=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Mon, 9 Feb 2026, Vishnu Sankar wrote:
>
> > Document the doubletap_enable sysfs attribute for ThinkPad ACPI driver.
> >
> > Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> > ---
>
> > +        * 1 - doubletap events are processed (default)
> > +     * 0 - doubletap events are filtered out (ignored)
>
> There's something odd in space vs tab here.
I will check this.
>
> --
>  i.
>


--=20

Regards,

      Vishnu Sankar
