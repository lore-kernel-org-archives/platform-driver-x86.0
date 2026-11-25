Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.85.9.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607176;
	b=jiBMRa31cN2ZGlVG8HTu5+BkVZb59cnnGFNcYU8qHZ2xjkdB9hMvZ8h7xss1U4JXvezt
	 aznM3kBjUqA1khg1+JfZkRG1onTK7Bfu+AISFnRn0hHfFA8Ml1f9MWmH3zda/qwVVxeXF
	 FNeEOZR9sE4uth+a9I5TZhtHRwnmTZGJ6XBlM5/xYKpp41sHgNyciOFwfHNWpqj0u9lPV
	 cBhWLmkTsAbD8X4k0gKDCS8lD3tz8ZPgoOYct6mUR2thIX0ngIGTJBC7UDwWNI/ScQGTl
	 ofAT8Xn3Dv6Zz3Ry+jN/thwlewMmkH2fqZkx0UB9+gkCTF9lAifaiaaSL4y2ln4RKTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607176;
	h=DMARC-Filter:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=DpArIvxr3KOunlhtH1Io/OL1G52P9Bdd6eSpDcy8nJ8=;
	b=Uze0slBMKsEYVXC9bUtr5QvI5aChqRlSG721h3AB4zWoCKbmNGvrd5sAWRyOGXn/keWg
	 VDcelJnK8qpUCN8NNo0QKPLWpEqIFmjVcUQw7BHWNX4YwLV11TFQuq4LPcz21kjpWpNvN
	 Dfc1zG3mDt710BlLJzMJl3znyY82/YhF3vQMTNQkXdDjGldMINWN07MndXEtv9AZAay58
	 lqJ6uG3sJUBFA+SzHSdVWq5QDIcp2FXvg3mDCSLNF8op0nvZovlS09965vJ/TSpvMu1lu
	 6ai5sLvBcrxJZNJdYRyiAkEirtvIbF9MuukXZdWcMtiTR2GL2BEDmeA6gIvGxKy/Z4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=irl.hu;
	spf=pass smtp.mailfrom=irl.hu;
	arc=none smtp.remote-ip=95.85.9.111
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 4C6D9606A326;
	Wed, 25 Nov 2026 11:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C6D9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from [192.168.2.4] (51b695b0.dsl.pool.telekom.hu [::ffff:81.182.149.176])
  (AUTH: CRAM-MD5 soyer@irl.hu, SSL: TLS1.3,256bits,ECDHE_RSA_AES_256_GCM_SHA384)
  by irl.hu with ESMTPSA
  id 000000000008120F.000000006B06CA85.00015913; Wed, 25 Nov 2026 12:46:13 +0100
Message-ID: <005f13d17c178db0ee3f76344a0c1f1a07f89a00.camel@irl.hu>
Subject: Re: [PATCH v2 6/7] platform/x86: ideapad-laptop: Trigger the EC on
 YMC events following Windows behavior
From: Gergo Koteles <soyer@irl.hu>
To: Rong Zhang <i@rong.moe>,
  Mark Pearson <mpearson-lenovo@squebb.ca>,
  "Derek J. Clark" <derekjohn.clark@gmail.com>,
  Hans de Goede <hansg@kernel.org>,
  Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
  Ike Panhc <ikepanhc@gmail.com>,
  Andrew Kallmeyer <kallmeyeras@gmail.com>
Cc: Eduard Aliman <edialiman20@gmail.com>,
  platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
  Mahir Faisal <mahirfaisalantiq33@gmail.com>
Date: Wed, 25 Nov 2026 12:46:05 +0100
In-Reply-To: <7bf18131ce00d8aeab1e01721dc0cd71972ea365.camel@rong.moe>
References: <20261125-ymc-82yl-v2-0-624bdcb3c50e@rong.moe>
			 <20261125-ymc-82yl-v2-6-624bdcb3c50e@rong.moe>
		 <84a3d94cc78ba0a26ed7b0af7cfcbde65433aa1e.camel@irl.hu>
	 <7bf18131ce00d8aeab1e01721dc0cd71972ea365.camel@rong.moe>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Rong,

On Wed, 2026-11-25 at 19:26 +0800, Rong Zhang wrote:
> Hi Gergo,
>=20
> Thanks for testing.
>=20
> On Wed, 2026-11-25 at 11:56 +0100, Gergo Koteles wrote:
> > Hi Rong,
> >=20
> > Thank you for taking care of this.
> >=20
> > On Wed, 2026-11-25 at 02:17 +0800, Rong Zhang wrote:
> > > Currently, the ideapad-laptop driver triggers the EC with YMC command
> > > 0x01, which seems to be randomly chosen with trial-and-error and turn=
s
> > > out to be not a command for YMC events. While the devices in the DMI
> > > quirk table recognize it, some other devices do not, making the
> > > trigger_ec functionality a no-op.
> > >=20
> > > Lenovo's YMC driver for Windows (YMC.exe) emits YMC command 0x08/0x09=
 on
> > > fold/unfold YMC events, in which "unfold" means laptop mode and "fold=
"
> > > means other modes.
> > >=20
> > > Adopt the said sequence to make it work on all relevant devices. For =
the
> > > sake of caution, only emit YMC command 0x08 only for the known fold
> > > postures. For all other postures (including unknown ones), emit 0x09 =
to
> > > make sure the touchpad and keyboard are still functional.
> > >=20
> > > Reported-by: Mahir Faisal <mahirfaisalantiq33@gmail.com>
> > > Closes: https://msgid.link/CAGAHqH6o0TUa1HXMrNV6e+HNYwU3xxHkOM665756n=
8Cp3AzhVQ@mail.gmail.com
> > > Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > > Signed-off-by: Rong Zhang <i@rong.moe>
> > > ---
> > > Changes in v2:
> > > - Fix typos (thanks Mark Pearson)
> > > ---
> > >=20
> >=20
> > ...
> >=20
> > >  	scoped_guard(mutex, &priv->vpc_mutex)
> > > -		ret =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_YMC, 1);
> > > +		ret =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_YMC, cmd);
> >=20
> > Unfortunately, the 14ARB7 does not emit a SW_TABLET_MODE after
> > triggering the ec with 8/9 or the fixed value of 8 or 9. It only works
> > with 1.
>=20
> Did you mean triggering the EC with 8/9 acts like a kill-switch on your
> device that blocks any *further* LENOVO_YMC_EVENTs? Can triggering the EC
> with 1 again makes it recover?
>=20

Yes, the value 1 will recover it.

> >=20
> > However, it turns off the keyboard and touchpad when triggered by 8/9
> > or 1, as well as without any trigger.
>=20
> So it seems that any YMC commands can synchronize the state of the
> keyboard and touchpad, but only 1 can actually "consume" the event.
>=20
> >=20
> > Perhaps the triggering should be handled on a per-model basis?
>=20
> I don't want to add too many complexities to the DMI quirk table and the
> module parameter.
>=20
> Considering that triggering the EC with 1 does nothing on newer models,
> perhaps we can trigger the EC with 8,1/9,1 as long as the trailing 1
> recovers the event delivery.
>=20

Writing 8 + 1 / 9 + 1 works.


Thanks,
Gergo
