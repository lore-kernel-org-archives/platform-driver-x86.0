Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795744649;
	b=bHxz7XB65IjgWitNmnVmCJ5fdSdKiuHdHTjqk4mfg53TCkHefKRWETZHwQepBZg5Ajh6
	 jc0GQx24AYb9fzAlg8i4uLKct03M3llhJ+eH9DKmXQXrkEZLNXHu3qFy/+j1w+0xZvUDU
	 LlThRuJzcwWWosFzwTn+63+dXi1rQrtsZjnEMgdlRuqrIuL/QzqH1jL/EV06klna4998x
	 mCtAZkKgxxeOK+BPEAN4hrSColvKT7/VFfjWAQJJ6qC03FoJ9aEpxkxByAlM8hyMrWt0O
	 s7IWlQoVcbczCynJwY0zw9YiaBll3gRGBmQnT6sU8Fl0fR/NAiKPYMo+p81n3I6EWlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795744649;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=l+CPXweMRUnqec49OfMbBWLYSFqeLyP79x5EiJjbiB0=;
	b=Fffx2vj9PiaUJu1hTAe4Tm51e4tvck8BF3fiz1YPJruoLs7Z80+81+QLAqd9xvEu20xR
	 Nd4DJouDJi73emlh/KRx7PBhIJ/mGVNe7GZAWrPDW+tk+qotSu/ej47LUJRvbcABDEXnc
	 2sviiFCqQICv5Nfxi+5JlTrERNe33ZC0MeB4hssXww1W/uFr7EmbOvek/gJ0F1MUWQmOC
	 +IqM3rNMWWSUSrzeXOI4B0Hsagym/6De9NtmeUWihQeZdP/+PU6WrKp8ps2fVXZgV/XDv
	 WNvD+dcT48oZHP6HKpOPP8N4yvDCwhQnf6IEYvrT0pf49v5tLLmGfO/xkDG32LKr4kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=kUKLujF4;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=zkU4qSoX;
	arc=none smtp.remote-ip=202.12.124.152
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD37606A31E
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 01:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAD37606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=kUKLujF4;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=zkU4qSoX
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EF36B7A0534
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 20:57:27 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Thu, 26 Nov 2026 20:57:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795744647;
	 x=1795831047; bh=l+CPXweMRUnqec49OfMbBWLYSFqeLyP79x5EiJjbiB0=; b=
	kUKLujF4FyTGcE2IIKCMUALVL4/LtZTa+XVWgKASU5J/xhhNUAC/XcL6cv84LVMg
	LP1knj/+C7wF3bAAAHZr3/ogGmxkpGiYaPznStnLJDhO+FlK4Y7paQZlW5YzpMlv
	1coXOQSPBv5SCRO/Vc9L6MnkdbYfcmEbgwU7EemwJpxf2nsb6FQQDbQA8dm72tzg
	7rnURa/QPqdF6tlsCb8C1YWJeFVo1AjuF4v9FqQzuLe6Y8TUt7cktT7sYMcJ6t+H
	vt7DoluiYMYy89VHOQSz3t6iNYF52axM9+tLXkEZd2VYJAhxdM9FSvuGUMKDzYMo
	h8PUn8cTpxzyBMbxWzwkuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795744647; x=
	1795831047; bh=l+CPXweMRUnqec49OfMbBWLYSFqeLyP79x5EiJjbiB0=; b=z
	kU4qSoXBS/rkNuHXVW39sDNH/YApTsgAb4G2YURYP7u1hmnRI17f4I9grqv9e/8T
	8KlHZsgj2Zbm08M5xV0T2/vjVIQ0hRcRpCWe2eN6UcIwfpIAEMsT/TcTCjryOcAs
	J7SaUdy/+n3K4Eavvj2jNhVjUciOQc1SYCzsKl6A2v45v2OCn/YqMyRYBpTFgMSy
	GZ4y2/e24VkQYwiu45JW60Wp4awfjkHiC1RSAxQfHwPa1Wn6jFXnq9/afE/eVgZX
	hLX5Ca33PC3ZXSiLwpLVjJqLJPx6pwsXTntZLMSDJ/hMu5BXjYTqSkqSV58ZsqDb
	/7DrvRVjDk0ShnnB/Rtfg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795744647; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:PsVPsq+xhXYr9EQyrBq0l2Etr5nW+t4x+d8rJ82DEnmkweo
	WnPoiKM+MWnBFWqYLr/ybQDxtdUm6ER64zGYQbnx37jeooUarZFeBpUoSaTquDBa
	RUjGivxjVWispKoQ3GvXoob1kNgnRZpkXv6Srr9rpR2q7Jl98QMszvy8GJqcqmgi
	iF/fM6jfj10ioxRnea7wknQHGu+/qRObyahLcaBt4mGMtzg+BURva8pji0Aez2xg
	zOyMhw0T4vLk03Mcf+Wal5YWwazNyHS6PYpV2+PEdD1KG0eyd+p4NbcboTLcQQaq
	TYJPyE0OYsqR9Vh4oz89DAjjcnELhAtHgmdysSQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:7j5LoRrf0ql+Zew650b+ljinVSvyFcOY2TZEJu4ZE2M=:RQ7ggPE0iLF0mjVtdUMvS3GgEsgMGt1oxonqcyHgHvA=;
X-ME-Sender: <xms:huMIa9jEj_6_iTol3Er9-NXni6Kfz9DaNq-nueP_Xe0c94Rw7JvDTQ>
    <xme:huMIa82zvzBO6WZ0tYE9-SvJ_VxSa-O6pmqRcOhv00JR_TXrfBCq9ffW-V_O8tbBE
    CiCeZrT8WAdkyKVJzTeoazUPzUXWuifwaWIbkpBfgkdkm8Oh53MDEbH>
X-ME-Proxy-Cause: dmFkZTEUlesYaxSNCHgLCphpm36UGh0hbTP08ieoXHpziogU3inuBwPuRA7my55MEMqMn3
    /zVO7onGrP/acYzCCpgG+a1BXpyF/zh9Txq716+OJ8WzKjfIW2ZZs5UNQyjPk4LUBmGthC
    c38uSjx1ML5hOGKw0zOGctHN4X0OfvBJH5wWsP+EMmBIjPt4aHJ/5Yk6Fgi4go2nkMeBdx
    uFQZrnX5xZ0BHsD6jG1Ab4dZkr+H5OMjkZIothd1gHt6dyCrtaK1ArGn1nJfBkn7Ui8XCw
    4iSfzQAkjR7bGQchupvKlmvHAxaQqDr+BpS4qL76q0nqFxQ0HglyZfhqyRivyQ0gFgdgjZ
    mzO5dogLYbspBCNIUc4lD0WsaOOr8YGZB52C3I32jfeOP6f00ub+nvt3PnYM17E0tP6IZP
    w49hBePRiJ3vZ67+PgRuFCSRcErhiAJMXMkLye9FOqCrcfTDX2CLWsG+JDXx+Mbod/CiXW
    zllK6RIg8yOwktQ9bzL4f1hFbfnaJre2VU0DUI6f1BpAu45aZAvT3mouCctSJV3dQXLoEd
    nJDfPJ8MrDihkwWV6NXu7Sa2ejENhy4tBfeZGUqaMGeV31cOoUxNhbOos8xbLCkIGOk9Ej
    Fz1g3njTy9KOGZuJJTCJRUUt7dfnZ3e36QZB/uG6IVU83h//x0fL3lLs6JNw
X-ME-Proxy: <xmx:huMIa2WSvF0duUxOjaFoy5AzF0Czt3fUg7fd-Kyi_aMJWOOBFB_13A>
    <xmx:huMIa_Rel-3pQvD74Xneavg_QtoaY4uBnGsWlVyoTra_7dTx6TRfgA>
    <xmx:huMIa-SIoMPSCcod5_emnVMrzd5zAxx7NnbIz7D15pP-J2cMKuZ03Q>
    <xmx:huMIa3cUTQ45fHSmgNv8oRaYkePixlPjbZuRTPE0fFotGnKPZ6ZDFQ>
    <xmx:h-MIa8t1c0m7PHmEkFhZGVlkPrnrHjVitQg3us7k4VQjJ8MHAimtVCIp>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 370752C00085; Thu, 26 Nov 2026 20:57:26 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: A018hRoekgxR
Date: Thu, 26 Nov 2026 20:57:06 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Vishnu Sankar" <vishnuocv@gmail.com>, "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>, "Rong Zhang" <i@rong.moe>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Huang Wei" <huangwei@kylinos.cn>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 klorico2@lenovo.com, "Vishnu Sankar" <vsankar@lenovo.com>
Message-Id: <919d3d4c-38c0-46a4-9442-73094197f6b1@app.fastmail.com>
In-Reply-To: <20261126085937.53711-1-vishnuocv@gmail.com>
References: <20261126085937.53711-1-vishnuocv@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix fan speed reporting on X9 Gen 1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Thanks Vishnu,

On Thu, Nov 26, 2026, at 3:59 AM, Vishnu Sankar wrote:
> On the ThinkPad X9-14 Gen 1 and X9-15 Gen 1, the EC reports fan1 RPM
> in registers 0x84/0x85 and fan2 RPM in 0x82/0x83, and does not use
> bit 0 of 0x31 as a fan select. As a result fan2 reports fan1's speed,
> and every fan read overwrites an EC-owned bit.
>
> The EC also does not latch either register pair, so a read can combine
> the LSB of a new value with the MSB of an old one.
>
> Add two quirks: TPACPI_FAN_2REG reads fan2 from 0x82/0x83 and never
> touches 0x31, and TPACPI_FAN_UNLATCH re-reads an RPM register pair
> until the MSB is stable. Enable both for the X9 Gen 1 models.
>
> A single fan level write controls both fans on these models, so second
> fan control is disabled when TPACPI_FAN_2REG is set.
>
> Tested on X9-14 Gen 1 (BIOS N4DET42W, EC N4DHT39W).
>
> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 79 ++++++++++++++++++---
>  1 file changed, 68 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 4f81855ad721..266f774b8ac3 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -7964,6 +7964,8 @@ enum {					/* Fan control constants */
>  	fan_select_offset = 0x31,	/* EC register 0x31 (Firmware 7M)
>  					   bit 0 selects which fan is active */
> 
> +	fan2_rpm_offset = 0x82,		/* EC register 0x82: LSB, 0x83 MSB (fan2 
> RPM) */
> +
>  	fan_status_offset_ns = 0x93,	/* Special status/control offset for 
> non-standard EC Fan1 */
>  	fan2_status_offset_ns = 0x96,	/* Special status/control offset for 
> non-standard EC Fan2 */
>  	fan_rpm_status_ns = 0x95,	/* Special offset for Fan1 RPM status for 
> non-standard EC */
> @@ -8012,6 +8014,8 @@ static int fan_watchdog_maxinterval;
>  static bool fan_with_ns_addr;
>  static bool ecfw_with_fan_dec_rpm;
>  static bool fan_speed_in_tpr;
> +static bool fan2_with_own_rpm_reg;
> +static bool fan_rpm_unlatched;
> 
>  static struct mutex fan_mutex;
> 
> @@ -8073,6 +8077,9 @@ static void fan_quirk1_handle(u8 *fan_status)
>  /* Select main fan on X60/X61, NOOP on others */
>  static bool fan_select_fan1(void)
>  {
> +	if (fan2_with_own_rpm_reg)
> +		return true;
> +
>  	if (tp_features.second_fan) {
>  		u8 val;
> 
> @@ -8093,6 +8100,9 @@ static bool fan_select_fan2(void)
>  	if (!tp_features.second_fan)
>  		return false;
> 
> +	if (fan2_with_own_rpm_reg)
> +		return true;
> +
>  	if (ec_read(fan_select_offset, &val) < 0)
>  		return false;
>  	val |= 0x01U;
> @@ -8202,21 +8212,48 @@ static int fan_get_status_safe(u8 *status)
>  	return 0;
>  }
> 
> +/* Read a 16-bit RPM register pair (LSB at offset, MSB at offset + 1) */
> +static bool fan_read_rpm(u8 offset, unsigned int *rpm)
> +{
> +	u8 hi, lo, hi2;
> +	int retries = 3;
> +
> +	if (fan_rpm_unlatched) {
> +		/* No latch: re-read until the MSB is stable */
> +		do {
> +			if (!acpi_ec_read(offset + 1, &hi) ||
> +			    !acpi_ec_read(offset, &lo) ||
> +			    !acpi_ec_read(offset + 1, &hi2))
> +				return false;
> +		} while (hi != hi2 && --retries);
> +
> +		if (hi != hi2)
> +			return false;
> +	} else {
> +		if (!acpi_ec_read(offset, &lo) || !acpi_ec_read(offset + 1, &hi))
> +			return false;
> +	}
> +
> +	*rpm = (hi << 8) | lo;
> +	return true;
> +}
> +
>  static int fan_get_speed(unsigned int *speed)
>  {
> -	u8 hi, lo;
> +	unsigned int rpm;
> +	u8 lo;
> 
>  	switch (fan_status_access_mode) {
>  	case TPACPI_FAN_RD_TPEC:
>  		/* all except 570, 600e/x, 770e, 770x */
>  		if (unlikely(!fan_select_fan1()))
>  			return -EIO;
> -		if (unlikely(!acpi_ec_read(fan_rpm_offset, &lo) ||
> -			     !acpi_ec_read(fan_rpm_offset + 1, &hi)))
> +
> +		if (unlikely(!fan_read_rpm(fan_rpm_offset, &rpm)))
>  			return -EIO;
> 
>  		if (likely(speed)) {
> -			*speed = (hi << 8) | lo;
> +			*speed = rpm;
>  			if (fan_speed_in_tpr && *speed != 0)
>  				*speed = FAN_CLOCK_TPM / *speed;
>  		}
> @@ -8238,7 +8275,8 @@ static int fan_get_speed(unsigned int *speed)
> 
>  static int fan2_get_speed(unsigned int *speed)
>  {
> -	u8 hi, lo, status;
> +	unsigned int rpm;
> +	u8 lo, status;
>  	bool rc;
> 
>  	switch (fan_status_access_mode) {
> @@ -8246,14 +8284,16 @@ static int fan2_get_speed(unsigned int *speed)
>  		/* all except 570, 600e/x, 770e, 770x */
>  		if (unlikely(!fan_select_fan2()))
>  			return -EIO;
> -		rc = !acpi_ec_read(fan_rpm_offset, &lo) ||
> -			     !acpi_ec_read(fan_rpm_offset + 1, &hi);
> +
> +		rc = !fan_read_rpm(fan2_with_own_rpm_reg ? fan2_rpm_offset : fan_rpm_offset,
> +				   &rpm);
> +
>  		fan_select_fan1(); /* play it safe */
>  		if (rc)
>  			return -EIO;
> 
>  		if (likely(speed)) {
> -			*speed = (hi << 8) | lo;
> +			*speed = rpm;
>  			if (fan_speed_in_tpr && *speed != 0)
>  				*speed = FAN_CLOCK_TPM / *speed;
>  		}
> @@ -8873,6 +8913,8 @@ static const struct attribute_group 
> fan_driver_attr_group = {
>  #define TPACPI_FAN_DECRPM	0x0020		/* For ECFW's with RPM in register 
> as decimal */
>  #define TPACPI_FAN_TPR		0x0040		/* Fan speed is in Ticks Per 
> Revolution */
>  #define TPACPI_FAN_NOACPI	0x0080		/* Don't use ACPI methods even if 
> detected */
> +#define TPACPI_FAN_2REG		0x0100		/* Fan2 RPM in EC regs 0x82/0x83, no 
> fan select */
> +#define TPACPI_FAN_UNLATCH	0x0200		/* RPM registers are not latched */
> 
>  static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
>  	TPACPI_QEC_IBM('1', 'Y', TPACPI_FAN_Q1),
> @@ -8908,6 +8950,8 @@ static const struct tpacpi_quirk 
> fan_quirk_table[] __initconst = {
>  	TPACPI_Q_LNV3('R', '0', '0', TPACPI_FAN_NOACPI),/* E560 */
>  	TPACPI_Q_LNV3('R', '1', '2', TPACPI_FAN_NOACPI),/* T495 */
>  	TPACPI_Q_LNV3('R', '1', '3', TPACPI_FAN_NOACPI),/* T495s */
> +	TPACPI_Q_LNV3('N', '4', 'D', TPACPI_FAN_2REG | 
> TPACPI_FAN_UNLATCH),	/* X9-14 Gen 1 */
> +	TPACPI_Q_LNV3('N', '4', 'C', TPACPI_FAN_2REG | 
> TPACPI_FAN_UNLATCH),	/* X9-15 Gen 1 */
>  };
> 
>  static int __init fan_init(struct ibm_init_struct *iibm)
> @@ -8959,6 +9003,12 @@ static int __init fan_init(struct ibm_init_struct *iibm)
>  		tp_features.fan_ctrl_status_undef = 1;
>  	}
> 
> +	if (quirks & TPACPI_FAN_2REG)
> +		fan2_with_own_rpm_reg = true;
> +
> +	if (quirks & TPACPI_FAN_UNLATCH)
> +		fan_rpm_unlatched = true;
> +
>  	if (quirks & TPACPI_FAN_NOACPI) {
>  		/* E560, T495, T495s */
>  		pr_info("Ignoring buggy ACPI fan access method\n");
> @@ -8993,9 +9043,16 @@ static int __init fan_init(struct ibm_init_struct *iibm)
>  			if (res >= 0 && speed != FAN_NOT_PRESENT) {
>  				/* It responded - so let's assume it's there */
>  				tp_features.second_fan = 1;
> -				/* fan control not currently available for ns ECFW */
> -				tp_features.second_fan_ctl = !fan_with_ns_addr;
> -				pr_info("secondary fan control detected & enabled\n");
> +				/*
> +				 * fan control not currently available for ns ECFW,
> +				 * and not needed with 2REG: one write drives both fans
> +				 */
> +				tp_features.second_fan_ctl = !fan_with_ns_addr &&
> +							     !fan2_with_own_rpm_reg;
> +				if (tp_features.second_fan_ctl)
> +					pr_info("secondary fan control detected & enabled\n");
> +				else
> +					pr_info("secondary fan detected\n");
>  			} else {
>  				/* Fan not auto-detected */
>  				tp_features.second_fan = 0;
> -- 
> 2.53.0

Looks good to me.
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
