Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0256D2D7BF;
	Mon,  6 Apr 2026 19:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775503426; cv=none; b=TPExCIyUyGRE+VYnU78Dj4lmudX+GCuSDWLst0wowN6nVmbjbbYTt+R//WiUZemBOp4Y1PKMRqiYALuiiZkK2obYd2rRekz3ahilOqxBKqfzKuy4ifS+4U2/1fVuAevPBmT3t9N+NdVECDzjh/grNRRfkFFFuGZbe95Vme3hThI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775503426; c=relaxed/simple;
	bh=5RxONuvzJvKwfB0a6qFhQg4E/OqQExrHn7hBsc1r0W8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=N6BhFI18NTiWlEA5ThjBBqV/VWYKEaxUQ5vX3o2VMfSTi+jnEkW1uNqNBTS9oVXPBtPMDZDjisnjNenxvs0iwe1T3/5T9UCn38w1P4UtTMSbFceDjRR22BwkIQkfwC8tLZyYxXF7vh3CpBiaciGcVK1DZHAtOL/VU+5p3BpY4JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=SW3EITjM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CWX2xgTb; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="SW3EITjM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CWX2xgTb"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 9705E1D001F1;
	Mon,  6 Apr 2026 15:23:43 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Mon, 06 Apr 2026 15:23:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1775503423;
	 x=1775589823; bh=ON3Kiz7lXcZ9y081vA8sj3D0u6J739Kxs7fJGIzL6H0=; b=
	SW3EITjMPRd4nBW8SCGEgxOiNt2epsH3q/xgxIDPJWKt9dQgW/MbObZYdauQzACa
	+AsATEFvDjiSFimE/M+iUM9lxHgJjWCTdHIPcsSE4Z2tzA27VGrQe8rYgXul3ixk
	LiH7IgnrVKv0vrDumqcNunisJ89msmCZ6N6S+dVs0Hubws3MCl/JFkaj2lmO0dD5
	xLV5nslmVsj+ATdsWpVnXoAdgmTs8vrNyJFuZnF8yPeH1aPenxLU896LJmlaN6u5
	ihsxKDerf749DUJBR65PY9vP8eBbzoM8QJhLVrD14AeDCgMEy6RpR5sXnvACJSF1
	h8kxP4h/N0KGnZyGUhdxnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775503423; x=
	1775589823; bh=ON3Kiz7lXcZ9y081vA8sj3D0u6J739Kxs7fJGIzL6H0=; b=C
	WX2xgTbBajAmAT4NZHjzvrkUrcM7lZKnhy6J4Q7EbsrVLLRyHwxxwRPba8ZMwFFd
	YFjdURXxzPX1V0W2/fa/mlxZElrn2uaLZ0GkLLxYuNp8Fh/bFIt4zAMBO0zohbr6
	gJEjHp0EhyQknrVwUNs0Psg/9o3FUjoh7Rgnk0IGaJ2CpaAPho3pa6uT79D6T1Mo
	+tlNmfy4I/4EiXEhtlLRsQm4I7rqVt0VTz6KYRxurS6PFf7zeU9ZgecDA7QFOySs
	MtWyxliGigqyRydDFQBIlD8JF/NMwYMI269bmGksoW4DWwxRAvfCCL/oghRtKD3r
	+3vCukf6LKariHkzxPWqQ==
X-ME-Sender: <xms:PgjUaT6fbAQOixciLrls1wnxXAD18uKzDXWC0kMRIz69lVHjcOzF8Q>
    <xme:PgjUaTtVCOYYNtPYw1GuqRXXwd38XgX-Ja7mhmplt42SjsWLtDeIyFeqLV6K1vYGB
    XGgjFJjfMVTpUQMjIOc-OXYd_a0fAhZr2fFVxF-1rXRE5jJr8hILSNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddukeehjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdforghrkhcu
    rfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
    eqnecuggftrfgrthhtvghrnhephfevkeejueeukeefhfelleejheeuudfgteffvdetkeff
    jeduleffvdejkeefhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgs
    pghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggvrhgvkh
    hjohhhnhdrtghlrghrkhesghhmrghilhdrtghomhdprhgtphhtthhopehkuhhurhhtsges
    ghhmrghilhdrtghomhdprhgtphhtthhopeifpggrrhhmihhnsehgmhigrdguvgdprhgtph
    htthhopehhrghnshhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehilhhpohdrjhgr
    rhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheptghorhgsvg
    htsehlfihnrdhnvghtpdhrtghpthhtohepihesrhhonhhgrdhmohgvpdhrtghpthhtohep
    lhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhr
    gh
X-ME-Proxy: <xmx:PgjUaQYHTj51TzVv5c8mIF4Z4mLGCpBQbfDEWOJnCpgvh13_k686Lw>
    <xmx:PgjUaX9I3MYNh48RWs2vALwvAXUHrCB5kYFDGRHPFrOT9WXjJ3ztSQ>
    <xmx:PgjUafYwp_-5_J6XijbU2QwZ7gAsyNhZ2t886AKIPXSWj07dioDxcA>
    <xmx:PgjUaRfeabc8KhN_9Xu9xKVgFQzMp_nAZMRzCh4L4WmjpWdhCAOM1A>
    <xmx:PwjUafceEBEzJpC3Wofq6c8VGcFblBaRHbpYl_Wenvm41EQdOOe1Hq4p>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A8A4C2CE3F93; Mon,  6 Apr 2026 15:23:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A78gagOl5mRc
Date: Mon, 06 Apr 2026 15:23:22 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Derek J . Clark" <derekjohn.clark@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hansg@kernel.org>, "Armin Wolf" <W_Armin@gmx.de>,
 "Jonathan Corbet" <corbet@lwn.net>, "Rong Zhang" <i@rong.moe>,
 "Kurt Borja" <kuurtb@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <f61511f9-b4fa-42df-84a4-097536ebb012@app.fastmail.com>
In-Reply-To: 
 <CAFqHKTkQdm3Fq_XAbPZ3uk+8NE2Q90sq6SaVJ7xbCBNVvbdc=g@mail.gmail.com>
References: <20260402032424.678528-1-derekjohn.clark@gmail.com>
 <20260402032424.678528-12-derekjohn.clark@gmail.com>
 <22b180a6-c6ee-4785-9cee-577b9f55d48b@app.fastmail.com>
 <CAFqHKTkQdm3Fq_XAbPZ3uk+8NE2Q90sq6SaVJ7xbCBNVvbdc=g@mail.gmail.com>
Subject: Re: [PATCH v7 11/16] platform/x86: lenovo-wmi-other: Add missing CPU tunable
 attributes
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Mon, Apr 6, 2026, at 3:14 PM, Derek John Clark wrote:
> On Sat, Apr 4, 2026 at 5:48=E2=80=AFPM Mark Pearson <mpearson-lenovo@s=
quebb.ca> wrote:
>>
>> Hi Derek
>>
>> On Wed, Apr 1, 2026, at 11:24 PM, Derek J. Clark wrote:
>> > Use an enum for all device ID's and CPU attribute feature ID's,
>> > add missing CPU attributes.
>> >
>> > Reviewed-by: Rong Zhang <i@rong.moe>
>> > Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
>> > ---
>> > v7:
>> >   - Fix typo in documentation.
>> > v4:
>> >   - Align type ID defines.
>> >   - Align CPU feature enum values.
>> >   - remove cpu_oc_stat from Documentation.
>> > v3:
>> >   - Remove cpu_oc_stat.
>> > ---
>> >  .../wmi/devices/lenovo-wmi-other.rst          |  9 ++
>> >  drivers/platform/x86/lenovo/wmi-capdata.h     |  5 +-
>> >  drivers/platform/x86/lenovo/wmi-other.c       | 99 +++++++++++++++=
+++-
>> >  3 files changed, 107 insertions(+), 6 deletions(-)
>> >
>> > diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst
>> > b/Documentation/wmi/devices/lenovo-wmi-other.rst
>> > index 01d471156738..189dd4d31926 100644
>> > --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
>> > +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
>> > @@ -68,9 +68,18 @@ Each attribute has the following properties:
>> >   - type
>> >
>> >  The following firmware-attributes are implemented:
>> > + - cpu_temp: CPU Thermal Load Limit
>> > + - ppt_cpu_cl: CPU Cross Loading Power Limit
>> > + - ppt_pl1_apu_spl: Platform Profile Tracking APU Sustained Power =
Limit
>> >   - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
>> > + - ppt_pl1_spl_cl: Platform Profile Tracking Cross Loading Sustain=
ed
>> > Power Limit
>> > + - ppt_pl1_tau: Exceed Duration for Platform Profile Tracking
>> > Sustained Power Limit
>> >   - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Trac=
king
>> > + - ppt_pl2_sppt_cl: Platform Profile Tracking Cross Loading Slow
>> > Package Tracking
>> >   - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Trac=
king
>> > + - ppt_pl3_fppt_cl: Platform Profile Tracking Cross Loading Fast
>> > Package Power Tracking
>> > + - ppt_pl4_ipl: Platform Profile Tracking Instantaneous Power Limit
>> > + - ppt_pl4_ipl_cl: Platform Profile Tracking Cross Loading
>> > Instantaneous Power Limit
>> >
>>
>> Just wanted to flag that the naming for sppt and fppt seems wrong to =
me. Wanted to make sure it was deliberate.
>>
>> I have, for Feature ID's:
>> 1 =3D CPU Short Term Power Limit (you have Slow package Power Trackin=
g)
>> 3 =3D CPU Peak Power Limit (you have as Fast Package Power Tracking)
>>
>
> Hmm, that does seem to be what the documentation shows. However, from
> what my devices report this appears to be correct in practice. From my
> Lenovo Legion Go:
>
>     ATTR{attributes/ppt_pl1_spl/current_value}=3D=3D"20"
>     ATTR{attributes/ppt_pl1_spl/max_value}=3D=3D"30"
>     ATTR{attributes/ppt_pl2_sppt/current_value}=3D=3D"22"
>     ATTR{attributes/ppt_pl2_sppt/max_value}=3D=3D"35"
>     ATTR{attributes/ppt_pl3_fppt/current_value}=3D=3D"24"
>     ATTR{attributes/ppt_pl3_fppt/max_value}=3D=3D"41"
>
> It seems the max values line up with the intended use cases for each
> attribute, and ryzenadj reports the same current values here when
> probed. I would personally chock this up to Lenovo documentation being
> wrong, but perhaps the situation is different with an Intel device? I
> don't have one on hand to verify with.
>
Ah - good point. I don't have an Intel one either :)

I think you're probably right about Lenovo documentation so unless I fin=
d out otherwise let's leave it as it is.

Mark
