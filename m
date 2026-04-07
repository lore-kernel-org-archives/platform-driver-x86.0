Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6E53469FC;
	Tue,  7 Apr 2026 17:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775583595; cv=none; b=FdrC+MNeLn/6mFyyCojxBrd5oZn3Pn2RH8zKkuXFx4O4S8hzZYjodMNovKvGs+M7PBN5CvRumGQuP/l13G7M0VLL4vtmc78zWDtVCLa+Mf2mpfLb7gNV3mfCjVeXxBUj/0vIv+6kFDh7rboyvAvX1H6n6AySq5jd8wUdhN9WO74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775583595; c=relaxed/simple;
	bh=Q/1BRvkcCzm61Op33ghmmbAOx4r6KGe8hekNSrURQDc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=hQjWrsqTZM8pJ03u46QnfUTLcTWalyFbmAKKyvICX57koNfvKQ45AbNGzw33mKjfVhZjU0P8l7VeR63HV25LtgnBma/BSDrWJbx/3I4hTGZwHZyvr3RKGkSexsyJuf9p2BiwXVhJPPKav1OItm/iojn1SCxEusSaWiE+I3zgpfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=aMRNImzj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=A9hd9AYZ; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="aMRNImzj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="A9hd9AYZ"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id D9D6AEC04A4;
	Tue,  7 Apr 2026 13:39:50 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Tue, 07 Apr 2026 13:39:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1775583590;
	 x=1775669990; bh=vyW4A3TVWiIRNcwE+FUGUf28XAk9UHsbgPFkDwrI1wI=; b=
	aMRNImzjNYm07+y2QrR4k1CpfAvu/9Igs7q9c1TsH4ujx4m0QifEzX6AV/ctZJe1
	aLrc06NwsH4KDbGfkVg1vOVV64GIkRRPwPjpF0MX0L/RuN18GH8K9kKsx2OibQSj
	ZLTcfsRt11u1R6I6wzDEjQLbwyyV7jJN+xHWRarp30D8/hy/KKm0TNjk9MzZG4ce
	Hwf6S3A+gqDbOUVRkWf7wFR+wabag2NJZFvTVXfj99pWrw2hbq4XwPbFbtbrn1bh
	LUW/0BpQNetd8Ccqo6wUC12Vyb7n3j0uLFYD3Dt/jx9ioyik1WC98nUDDJCZgWFm
	ZQeLykXsAcuBgxa4LC5mjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775583590; x=
	1775669990; bh=vyW4A3TVWiIRNcwE+FUGUf28XAk9UHsbgPFkDwrI1wI=; b=A
	9hd9AYZdV/sqxtUXQNVend3n8QllOXHcsFgJKdNwjK4WAyRJxfgREQ2LmwGK6w3S
	F3IMg74HMUjjKl//FBpoDvrmv4x+bSxUrRYmcX8wkLWtqDWt3b3c7dGZSEhUOTVi
	iN7Ax3vrIAM/gOrau9MOWIdBXsKhKA9huyCzC2xuGIR/Q1PtR8BPgRcGyOMt0JG6
	ZjLi+nXEyHMmtrC3/SJQWBhJ8Nm2BgL8hM5dgXN8FQ4uIpCTZgDZBMkuF7IVTpaW
	YpxhhEpF2ArPcSGW3hIoZy/xrSttyKtvFuAIhQwQuBxtOlp7TyJDEi456Zj73fdv
	8tEi8uGwE3bittohGmjTw==
X-ME-Sender: <xms:ZkHVab5KGfTVptSrLYYGmWa-Pbw1A9KQ1Uxg4WMw_kQFZ0za5p9gtw>
    <xme:ZkHVabtaoi4hemqVmS0meOuIoodq6yHweD0LD6GZ2Jd5r4YitRiZxloy1o8iMXQdq
    UUPNB4QFUE2gGi5plLU_CgH5_0i_OiO9NFFIuNaR-RrnmVyuzcTBFs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvuddvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdforghrkhcu
    rfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
    eqnecuggftrfgrthhtvghrnhephfevkeejueeukeefhfelleejheeuudfgteffvdetkeff
    jeduleffvdejkeefhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgs
    pghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghulhhgrg
    hruggrnhhiihhludeksehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggvrhgvkhhjohhh
    nhdrtghlrghrkhesghhmrghilhdrtghomhdprhgtphhtthhopehhmhhhsehhmhhhrdgvnh
    hgrdgsrhdprhgtphhtthhopehhrghnshhgsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpth
    htohepihgsmhdqrggtphhiqdguvghvvghlsehlihhsthhsrdhsohhurhgtvghfohhrghgv
    rdhnvghtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhg
    vghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:ZkHVafKvDaFzuJDzHMujQc3OR2CCV1lko0da3YK131z0HZiKuG3fwg>
    <xmx:ZkHVaTkMof_fBgHS1fTyGbBO5kTL7MUUPyhbXx9t9S7XcFxPqChLGQ>
    <xmx:ZkHVaYZmIATahUrvC0zhOY9KG_6_7qVCFrS7ygmnzOuaW_1Md08QSQ>
    <xmx:ZkHVaf_xOw0A4wZyvGFylQ0Sxh5fF6xHBDcbCgOYT_hfPdU3boTZ9g>
    <xmx:ZkHVaQOdLfwyqo_C6BB7J2XQCxdmfmcyiI4cESdJ723doqYw83f-dgPe>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3E3672CE3F93; Tue,  7 Apr 2026 13:39:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ApC5oMBbhHqR
Date: Tue, 07 Apr 2026 13:39:29 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: 
 =?UTF-8?Q?=D0=94=D0=B0=D0=BD=D0=B8=D0=B8=D0=BB_=D0=91=D1=83=D0=BB=D0=B3?=
 =?UTF-8?Q?=D0=B0=D1=80=D1=8C?= <bulgardaniil18@gmail.com>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>
Cc: "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <e4723a5a-0bdd-4062-af38-ca5f4a4f6d1d@app.fastmail.com>
In-Reply-To: <096ee581-2c27-4746-bc7e-1d699a952764@app.fastmail.com>
References: 
 <CAMPU55i_MPW_MHBsBfbnrO7T5Q68q1QmNgLVBPiqoh30kGw4Pw@mail.gmail.com>
 <096ee581-2c27-4746-bc7e-1d699a952764@app.fastmail.com>
Subject: Re: [PATCH] platform/x86/lenovo: thinkpad_acpi: add named speed presets to
 fan_write_cmd_speed
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Daniil

On Mon, Mar 30, 2026, at 9:19 PM, Mark Pearson wrote:
> Hi Daniil
>
> On Mon, Mar 30, 2026, at 4:35 PM, =D0=94=D0=B0=D0=BD=D0=B8=D0=B8=D0=BB=
 =D0=91=D1=83=D0=BB=D0=B3=D0=B0=D1=80=D1=8C wrote:
>> platform/x86/lenovo: thinkpad_acpi: add named speed presets to
>> fan_write_cmd_speed
>>
>> The fan_write_cmd_speed() function had a TODO comment suggesting
>> support for named speed presets (low, medium, high). Implement
>> this by mapping the preset names to the existing fan_speed_presets
>> enum values, following the same strstarts() pattern used in
>> fan_write_cmd_level().
>> Signed-off-by: Daniil Bulgar <bulgardaniil18@gmail.com>
>> ---
>>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 17 +++++++++++++----
>>  1 file changed, 13 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> index 8982d92df..f10cebe11 100644
>> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> @@ -7957,6 +7957,12 @@ enum fan_control_commands {
>>                          * and also watchdog cmd */
>>  };
>>
>> +enum fan_speed_preset {
>> +    TPACPI_FAN_SPEED_LOW    =3D 65535 / 4,    /* 25% speed */
>> +    TPACPI_FAN_SPEED_MEDIUM    =3D 65535 / 2,    /* 50% speed */
>> +    TPACPI_FAN_SPEED_HIGH    =3D 65535,    /* 100% speed */
>> +};
>> +
>>  static bool fan_control_allowed;
>>
>>  static enum fan_status_access_mode fan_status_access_mode;
>> @@ -9249,10 +9255,13 @@ static int fan_write_cmd_speed(const char *cm=
d, int *rc)
>>  {
>>      int speed;
>>
>> -    /* TODO:
>> -    * Support speed <low> <medium> <high> ? */
>> -
>> -    if (sscanf(cmd, "speed %d", &speed) !=3D 1)
>> +    if (strstarts(cmd, "speed low"))
>> +        speed =3D TPACPI_FAN_SPEED_LOW;
>> +    else if (strstarts(cmd, "speed medium"))
>> +        speed =3D TPACPI_FAN_SPEED_MEDIUM;
>> +    else if (strstarts(cmd, "speed high"))
>> +        speed =3D TPACPI_FAN_SPEED_HIGH;
>> +    else if (sscanf(cmd, "speed %d", &speed) !=3D 1)
>>          return 0;
>>
>>      *rc =3D fan_set_speed(speed);
>> --=20
>> 2.53.0
>
> I'd never noticed that TODO :)
>
> No issues with the code but I'd like to check with the thermal team if=20
> those are better ways of determining the ranges. I've got a feeling=20
> that they probably aren't.=20
> Fans don't go that high (or low) during operation so I wonder if there=20
> are better 'ranges' to be used (though it might be platform dependent=20
> too)
>
> I'll ask if there is any guidance on it.
>

Afraid I'm going to nack this patch.

I reviewed with the thermal team and there are 7 or more different level=
s and the speeds and steps between speeds can vary between platforms qui=
te significantly.
Trying to fit them into a low/medium/high framework just doesn't seem a =
good idea I'm afraid.

I'd be good with a patch removing the TODO comment :)

Mark

