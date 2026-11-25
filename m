Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795606297;
	b=yG7u6jMPh5ci+ggvtJIKgFommPyI1Evd/xIEM97Kt+5XHxu4+Huc+lDCx/6ntcE0vqAU
	 PrezbsMnef/UKA7pWBmvOH+iGs36hgOGYdBLdG0NEFZ86X7kxPyxBqOhpk6cK/5I5PFK2
	 NhoFnkynrcq+G3KHBi0aU31f8Mlvquh7VVm9YFTKUU2KkoLIQR7iRxQt/4jjOKnwZ5uS1
	 eLL24ICgvV4NLktIr15kidfiOneXpKR7grT+jERPn6s+S+6XN2wQY3FnbUaP3ahOeUSr1
	 CflVjdHhVripAtBofJKifAA65BTt+gyE+fb2NrTg/3DdP9ZL7+N52WFRp4ppuyN+rbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606297;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=4rv5RycQxbT02dsjoESum80afWkEnUKBnp9w2kgGko8=;
	b=3YFwEYuuXatWuMQo+njghFAxMU4iV25mHoI2tQHiHsEFszznYomJytKVpIp56SVyOBVT
	 /fADGLBsUW+Frt7rvVn2sN18iX/x+dd+x7DqlGkaGqxYbHw1MMzwedDonkGIP6RwvYYLW
	 Xiv+t7Myqz3OmXj7USRt/tN0VItOYA2WivhYXSGT10u22bVi7qqzYf/sACaKTunBooQR2
	 Hxi4lgsULQnzLOfZh1OmbKjEdinFdj3qkHGARYP1QFRjjibkFgipSZlKz7wfjJ50QsyeE
	 NUevE0E94r/xVXy1Azw5dQNTPCa60idiWROifWTNzD3fqxpg5zD/f8XRC6Wd7UbdJIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=qo0QHzXU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
Received: from sender5-pp-f112.zoho.com (sender5-pp-f112.zoho.com [165.173.182.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A21606A31E;
	Wed, 25 Nov 2026 11:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89A21606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=qo0QHzXU
ARC-Seal: i=1; a=rsa-sha256; t=1795606272; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jXMlpgv9i0GLXxT1SZDB+DoaP9UfM8Tz7eyHvyxwNe3KESSTgUlovOvBe9tPaQsYGIrICNNKQiKgjZE8rf6QfJfneHVfHlntpcLB9w5ZWOTGOML+v0/tYWxIKo7ACOhG7AYEhNtPiaiJpR+pUjUhksd5JNAlsAa7jr2lrLobNlw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795606272; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4rv5RycQxbT02dsjoESum80afWkEnUKBnp9w2kgGko8=; 
	b=nKAm3B5mzMyyRlYmCcSvVTQMxtroi2L0UmANanjVKgH2o7sqXbrTuysYaPfRoK5lBMDXWujgtIh86EK2zjDakg6UQofN5S/nejdb2MUaLE44QDuqKrKkfUS2oo+AeTo5QJ2H/1Ayjhq7XFlKdxFT80XWMkGRgoKcp7bHM4SncPU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=qo0QHzXUDHlWZebW7EyErkqgyNWVqXY+MHkk8fuzx0VN6qpt4JzHXyfPi96S2AyppaQY7Md1B6TI2X0p4QDJ7OPiXUQrVEHDToa6Z7NT7OJGevrIOzc9cnvOC/jNKitPmeACl1NuRUQWIWyxlj5DRr6mP9zIkMcjRcV/xbfjcRUEcO65NwRYPzLp8GpvjVPMmtxpuHoWtli2kGyB2IlMXCDv2EOrPq2j9KOqa1IIG7d3nlFZf1nUtlcLuDADYdDrsNQmHwyMvIMSXcbcp2XqcKcrnS1Tsr6lnT3LrHm1i4ft6aXYpCRa+/ymwEtvKqITkEpFstb8rw/zdXjmw1hgGw==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=4rv5RycQxbT02dsjoESum80afWkEnUKBnp9w2kgGko8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795606270046330.59459289497283;
	Wed, 25 Nov 2026 03:31:10 -0800 (PST)
Message-ID: <7bf18131ce00d8aeab1e01721dc0cd71972ea365.camel@rong.moe>
Subject: Re: [PATCH v2 6/7] platform/x86: ideapad-laptop: Trigger the EC on
 YMC events following Windows behavior
From: Rong Zhang <i@rong.moe>
To: Gergo Koteles <soyer@irl.hu>, Mark Pearson <mpearson-lenovo@squebb.ca>,
  "Derek J. Clark" <derekjohn.clark@gmail.com>, Hans de Goede
 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, Ike Panhc <ikepanhc@gmail.com>, Andrew
 Kallmeyer <kallmeyeras@gmail.com>
Cc: Eduard Aliman <edialiman20@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Mahir
 Faisal	 <mahirfaisalantiq33@gmail.com>
In-Reply-To: <84a3d94cc78ba0a26ed7b0af7cfcbde65433aa1e.camel@irl.hu>
References: <20261125-ymc-82yl-v2-0-624bdcb3c50e@rong.moe>
		 <20261125-ymc-82yl-v2-6-624bdcb3c50e@rong.moe>
	 <84a3d94cc78ba0a26ed7b0af7cfcbde65433aa1e.camel@irl.hu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 19:26:02 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-4 
X-ZohoMailClient: External

Hi Gergo,

Thanks for testing.

On Wed, 2026-11-25 at 11:56 +0100, Gergo Koteles wrote:
> Hi Rong,
>=20
> Thank you for taking care of this.
>=20
> On Wed, 2026-11-25 at 02:17 +0800, Rong Zhang wrote:
> > Currently, the ideapad-laptop driver triggers the EC with YMC command
> > 0x01, which seems to be randomly chosen with trial-and-error and turns
> > out to be not a command for YMC events. While the devices in the DMI
> > quirk table recognize it, some other devices do not, making the
> > trigger_ec functionality a no-op.
> >=20
> > Lenovo's YMC driver for Windows (YMC.exe) emits YMC command 0x08/0x09 o=
n
> > fold/unfold YMC events, in which "unfold" means laptop mode and "fold"
> > means other modes.
> >=20
> > Adopt the said sequence to make it work on all relevant devices. For th=
e
> > sake of caution, only emit YMC command 0x08 only for the known fold
> > postures. For all other postures (including unknown ones), emit 0x09 to
> > make sure the touchpad and keyboard are still functional.
> >=20
> > Reported-by: Mahir Faisal <mahirfaisalantiq33@gmail.com>
> > Closes: https://msgid.link/CAGAHqH6o0TUa1HXMrNV6e+HNYwU3xxHkOM665756n8C=
p3AzhVQ@mail.gmail.com
> > Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > ---
> > Changes in v2:
> > - Fix typos (thanks Mark Pearson)
> > ---
> >=20
>=20
> ...
>=20
> >  =09scoped_guard(mutex, &priv->vpc_mutex)
> > -=09=09ret =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_YMC, 1);
> > +=09=09ret =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_YMC, cmd);
>=20
> Unfortunately, the 14ARB7 does not emit a SW_TABLET_MODE after
> triggering the ec with 8/9 or the fixed value of 8 or 9. It only works
> with 1.

Did you mean triggering the EC with 8/9 acts like a kill-switch on your
device that blocks any *further* LENOVO_YMC_EVENTs? Can triggering the EC
with 1 again makes it recover?

>=20
> However, it turns off the keyboard and touchpad when triggered by 8/9
> or 1, as well as without any trigger.

So it seems that any YMC commands can synchronize the state of the
keyboard and touchpad, but only 1 can actually "consume" the event.

>=20
> Perhaps the triggering should be handled on a per-model basis?

I don't want to add too many complexities to the DMI quirk table and the
module parameter.

Considering that triggering the EC with 1 does nothing on newer models,
perhaps we can trigger the EC with 8,1/9,1 as long as the trailing 1
recovers the event delivery.

Thanks,
Rong

>=20
> Best regards,
> Gergo
