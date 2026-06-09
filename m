Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5215C29B78D;
	Tue,  9 Jun 2026 01:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780968621; cv=none; b=IgJac0Ds3Ye9TITo0nzXTsPQgThM+u7KoH5lDv18ckcMl+dv8+6q0uKe498DfPs2RWML3OCt2P5GFIrQzCGuRc5i95Zav+fF7p1JGecS9s03N5bNnceGJa0ghwZt2GOb12kg2QSXMJLZt+3ZP6tj1pCEVbCHXrymYGFknpfoO4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780968621; c=relaxed/simple;
	bh=qfHt1v9yQtLM/QQ97cUENUJQZgSuIj73BfKtaHFQX/Q=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=upOL0dtjjBZyzn9hyPy2YgyOFfDQ7Z7vgiOBJsVApaDr4i7sDKq0pN1uBLiZX3ed/SD54/VeT39g/OkZvsu7/RuuHzuEcoxDCYLD0QpNkTdPvYmvc1BB3y1H0471QB6m9BacbhTz+U5ruolBHuUSu2Y0dpjwnDzjiVUaMXzNEG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=a9bmGrXV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ymrdo0yH; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="a9bmGrXV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ymrdo0yH"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 91747EC0066;
	Mon,  8 Jun 2026 21:30:19 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Mon, 08 Jun 2026 21:30:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1780968619;
	 x=1781055019; bh=jUvhhf9+/Y2UwWcFih65OHhcN7nd/7e0YWmdX2du5jQ=; b=
	a9bmGrXVnOPZ6Nkjg0pEl0AG+t8WP9JEAgQOKeJmG9U0/pv/QW+p/qWdRw4PrihA
	vVRVD0OEgJOKWjLNYRnJz/AN8+JlXLlSn6nrU/X1LgLs6jAL8fM0AncINafWVYJN
	JK7OKbxcqAz/gXSnOoV7XJ0C4IMeJuNqjXuojwp4AvByFq/M1WsKIMQh+DPNoAZH
	f4ePPREc/j062rzf5gXs8Hpg+9Xwk3tVlOTW05YuOlXB9bYBiF16vcWLE39UeuFs
	sn+zaWZrUscioI/H/fOUj2yLILQRuI5VNdG95A4gyI2KlmKwj9klvbcNTRhH/sWo
	/jejRaiNwXiU2rs2nxmGFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780968619; x=
	1781055019; bh=jUvhhf9+/Y2UwWcFih65OHhcN7nd/7e0YWmdX2du5jQ=; b=Y
	mrdo0yHUP+vdDn+e1vQfV4vq/xrdDGxrqYaqXRzngMlYAPqwoIf6bD8Rx6aFrcBk
	DQa49eN68wd2iP5zaGaDftIOaiyc8FlSZxi5dsqPwx/yuPSd7IQwttbu774XJeHS
	FpoEuZ6UD7sNp7ALz7oLk+yhn7JUjuYkoTyxJp/E8pGQG/8oh3dRYFikaM1BXRLl
	8linsd+6ek48jz3NxofklXVryeGIYmQEq8+Snv/ZyrG8DGHbuEDiWUmRxnQ7inzO
	WhqsWqeyBFUSQOnq/4xsCjnEMano0afC8r1L0Fg853Wp+PWuZarW2OGMcZ/N5aa0
	wPnUOu9vIftWNE9XfOaSg==
X-ME-Sender: <xms:q2wnajszzl3X_kngmlo6dTn1srC-Lxg7c8RDXOJL7oU66U3eENlWxw>
    <xme:q2wnavSlxXIz0TEkhcp-pVyJHsNxb1KerGUR5oK0x1NZ8V27WzOuvTH0m37tb7BVG
    OXiVctyHSkp19IDNJDNPcEQbbcCm19V_U6iiQ750c5dZJJFLGTetT4>
X-ME-Proxy-Cause: dmFkZTG3XL7n0d6zccWYVE6YD5O3iLXKlk/xxJFzPK+aaNTBBef5039Cat2yglAlEzKObp
    YfS0OFO6RyakiZFNmGFBXaxCqjBmb4Q1fOMwPVxfPFFG3LgDL4sj5KX1wac4NSlbQKpRgJ
    NCKDV4a2De8wbYwPPD+GsjhuvS9gUeZokaIr2lgREA1Sih3yldqssrIe4THKRi3ooG/z/Q
    Gv1wfPsvKTdUASH7ZNF/9Niu5HkbwhNGXzUe7Z9eqsr8yL/Ug1J0JOK33nKpPwXcirPzed
    RFd33ihpZeJ66+k7BreFn2CYzu42aWIQP60vrompx3GMnFisTI1xIOZtldMnoEWiTayel4
    yMQn59grRthT/9cSgWo34bJH9ZoX1SeiC2NO4ybbIorRoQWwbUc1Or3WnFoXQWPEV9E7AU
    rm2IFdWDzXpGEiEvWjEMtuRUqXzL5c+6mD7M7hs/Mk5idBlC3abzRIoMsfJB9+ZefV+Dxp
    BAXQFu7pYIUifS1x8x3PkLfWp3P0y4p6s3WPSd7TjLoE+508S/LlxzS/b4Ci2sS0P9NZ42
    m3RL1+Td0XW1SZ7acqE9JV5U/qClAfL3UJ7uVNf/TgbSCKTHe4oJddnYROC+1koS+t/Lge
    f9RhM/p28c7aemfgwvHAfBwUyXmevYvje8zD5O3jw8wgAwsIawIYga92L0KQ
X-ME-Proxy: <xmx:q2wnatFyZGlOAYQgbrJHAoHPFsDSTyHwakXIvcWcQ112nCVMq6CdUw>
    <xmx:q2wnajAXSMQlMk2OkUM-kuV1OserQxP2bGQag9oRdNsc87fQmuJyUg>
    <xmx:q2wnatXTe5_QwcxxvkHs0WoMOyXJQPE85imooeVvKPdVCa7mXFxLTg>
    <xmx:q2wnanrvs3gdsEbXtukXZAWV9ix-kDLrAE7M6PfDeNIv-E-qfwmuyw>
    <xmx:q2wnajuheizRfxdczFunmxz-1pri06SbCAuZTvwofmn-A7546BkmliB9>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5343A2CE1D5B; Mon,  8 Jun 2026 21:30:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Av2xLY-ZXd6J
Date: Mon, 08 Jun 2026 21:29:59 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Dave Carey" <carvsdriver@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Cc: "Hans de Goede" <johannes.goede@oss.qualcomm.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 armin.wolf@outlook.de, linux-kernel@vger.kernel.org
Message-Id: <b106e72e-dbdd-4694-96ee-5d0506c278a5@app.fastmail.com>
In-Reply-To: <bacf91a6-b5b9-4597-a0de-b1435c1eb235@app.fastmail.com>
References: <73c27728-2f07-41c1-82c7-fd6f46c89f3c@oss.qualcomm.com>
 <20260608215205.678182-1-carvsdriver@gmail.com>
 <20260608215205.678182-2-carvsdriver@gmail.com>
 <bacf91a6-b5b9-4597-a0de-b1435c1eb235@app.fastmail.com>
Subject: Re: [PATCH v6 1/2] platform/x86/lenovo: lenovo-ymc: Suppress probe on Yoga
 Book 9 14IAH10
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Jun 8, 2026, at 9:29 PM, Mark Pearson wrote:
> Hi Dave
>
> On Mon, Jun 8, 2026, at 5:52 PM, Dave Carey wrote:
>> The Yoga Book 9 14IAH10 (DMI product name "83KJ") has a dedicated
>> yb9-kbdock WMI driver that registers an input device reporting
>> SW_TABLET_MODE to track the detachable Bluetooth keyboard.
>>
>> lenovo-ymc also loads on this machine and creates an input node with the
>> SW_TABLET_MODE capability bit set.  For input switches, the presence of
>> the capability bit has semantic meaning: userspace (e.g. GNOME) reads
>> the switch state at startup from every node advertising the capability
>> and does not expect more than one such node.
>>
>> Add a DMI match for the Yoga Book 9 14IAH10 to probe() so that
>> lenovo-ymc returns -ENODEV on this hardware, leaving yb9-kbdock as the
>> sole SW_TABLET_MODE source.  The ymc_ec_trigger EC write, the only
>> other action taken in response to a YMC event, is guarded by a separate
>> DMI table that excludes this machine; no other functionality is affected.
>>
>> Signed-off-by: Dave Carey <carvsdriver@gmail.com>
>> ---
>>  drivers/platform/x86/lenovo/ymc.c | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/drivers/platform/x86/lenovo/ymc.c 
>> b/drivers/platform/x86/lenovo/ymc.c
>> --- a/drivers/platform/x86/lenovo/ymc.c
>> +++ b/drivers/platform/x86/lenovo/ymc.c
>> @@ -23,7 +23,23 @@ module_param(force, bool, 0444);
>>  static bool force;
>>  module_param(force, bool, 0444);
>>  MODULE_PARM_DESC(force, "Force loading on boards without a convertible 
>> DMI chassis-type");
>>
>> +static const struct dmi_system_id lenovo_ymc_nosupport_dmi_table[] = {
>> +	{
>> +		/*
>> +		 * Yoga Book 9 14IAH10: SW_TABLET_MODE is reported by the
>> +		 * yb9-kbdock driver.  Suppress lenovo-ymc on this machine to
>> +		 * avoid userspace seeing two input nodes that both advertise
>> +		 * the SW_TABLET_MODE capability.
>> +		 */
>> +		.matches = {
>> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> +			DMI_MATCH(DMI_PRODUCT_NAME, "83KJ"),
>> +		},
>> +	},
>> +	{ }
>> +};
>> +
>>  static const struct dmi_system_id allowed_chasis_types_dmi_table[] = {
>>  	{
>>  		.matches = {
>> @@ -100,7 +116,10 @@ static int lenovo_ymc_probe(struct wmi_device 
>> *wdev, const void *ctx)
>>  	struct lenovo_ymc_private *priv;
>>  	struct input_dev *input_dev;
>>  	int err;
>>
>> +	if (dmi_check_system(lenovo_ymc_nosupport_dmi_table))
>> +		return -ENODEV;
>> +
>>  	if (!dmi_check_system(allowed_chasis_types_dmi_table)) {
>>  		if (force)
>>  			dev_info(&wdev->dev, "Force loading Lenovo YMC support\n");
>> --
>> 2.54.0
>
> I'm sure I'm missing the obvious - but where is the yb9-kbdock driver? 
> I can't find it...
>
> I was curious as to whether a separate driver was really needed for 
> this platform, or if it should have been integrated in the ymc driver 
> in the first place?
>
> Mark

Nevermind - ignore this. I just saw patch 2 and went Durrrr....
My brain is still in vacation mode :)
