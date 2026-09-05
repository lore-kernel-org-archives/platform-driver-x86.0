Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BC426ED3C;
	Sat,  5 Sep 2026 03:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788577590; cv=none; b=fiDWhWavC9Sal54MMZXorKRktnbknjgHuZsPTlo43OE2hM9D3oomZzuKqUCWUUTxCT9EicyVwG829w0kPQUoYn3VrqFX/WkaGw9TN5vj0TXLN2AWFN/4ANokPqMSJWeNyLGth4gTu3ox0ddfdzKZb0MONaORwZPm7gij/0u9D7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788577590; c=relaxed/simple;
	bh=RGDlyQ9H2nwJBex9eUF1DjBJUtvfwEUx0wzG1Ww522k=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ouOhum496+ce+rH6d/ZiaKasrd3mpoQe5fQnV2yNGyhxdQNGhUqt9zZH/+4tQr7dxnONfnk5lIASvh4saQUJdpmG/Wg3oYV7ZW1QR4DHHQEfUEd3xkmBJdrFaKGO589puuF0970Rg1qpy61FoORwykBVj0Roh++6zre2sfP/nPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=U8/fiiDh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uJ6pY9vP; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="U8/fiiDh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uJ6pY9vP"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E91351400175;
	Fri,  4 Sep 2026 23:06:26 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Fri, 04 Sep 2026 23:06:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788577586;
	 x=1788663986; bh=dn9SeHDAQcIwe9HEChWstYauXrPTAcknUczQtqewXPk=; b=
	U8/fiiDhXwUGVExA8rxK4uNAeUJJ1jagEoLx3d/K+f7fca4e/BOAp473MpPdQPMr
	0dtfWsXTOdy42VZYbBzSo8qnRiqBq0psmoSyp3u61ZulB6dSpV+khoGZ2azgXS/z
	pLWhC868+HAGG2Rgg+XBFqj7iDnrWoR7zpQH9jqWdaTmQvbN88mcLGodK42i9/8D
	C/PF9XOYD1UI01YdrPTHLByCzCyaBAI7Dr3+ivqPugT8RW/WoNDUM1I9remS3ZJZ
	1cptwBsOgO5SY34p7k/tF6t3w1DLLpzN5PhYH6a8kWZ9U0nqe9KGYYMyxlI8I3vD
	6XAxcsIa+Mza3W4Faz9qZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788577586; x=
	1788663986; bh=dn9SeHDAQcIwe9HEChWstYauXrPTAcknUczQtqewXPk=; b=u
	J6pY9vPRh6vbzy5ASzmq+FJmqrPnGU3zz749CTB+zgcctdvmNvCoNm9PPFmd+FQj
	pEA9Uq5wDZ+Aw9y/CAE0UCO9lLV120Kjcu3ugWfrEREKwZn7p6IsnZhFcjeMkiG+
	sj+nVTHw6MR4m6h29Zs5he0Ie234i3kl9EXCY3UWbaWSLe3Ak5uQngz6i+Af30e2
	eHd9laEAtE69vw1DccgaXb9sBxcdZf9O1xn/thlrDXoguPngz2BFZWu8ugWfo9H0
	UFAFikUtg9w/CEDCGMe63317SG7fpmG3lMEjkAWJEUzKTDXULjmBdsQiMKBDSuyk
	dArq/ALUu21a+/t9Tg3Pg==
X-ME-Sender: <xms:MYebaqxmv7UiAkEqFAxCd_x7n3zyZz8uSs0MImieQ0KWcSa2JP06uw>
    <xme:MYebahET3AKv0xC0xXCmrdB88Fnn9F3qM1hGUpZatSuSdTBD5ImLi_WfTv7Wkv1Y_
    dgXZSYKPZCKnEf7lKPBCLZcgjFXMqscaYSJjKUV2bF2-MfdS9nPlUQ>
X-ME-Proxy-Cause: dmFkZTEym1Tn+eMhDvRwnfE+SC2gn+fopTr1iM7H4lJ+v2c1irG/VFAZtUvb7I1pCQn8GS
    qsOuV26ugKoDPm4+xa42Xhii5OPHccVRFJ9pC07sKjntWY+lbP2q/QJAKzE1ye8M+GSTTW
    Y3AHtAtB2yX7lXHD33ObMrhSsTGe6Xx/ztr4/x8S7AtAzqdfXBT8wwWnGKq99h2Fwq0KxV
    tNaPL73ZVyernDpwMhMqtf8oGo+cMx6LFqXMgBvCvAqBbmt27/LgMz92Yz8CPBVohvBttk
    MPvfjtSMRU+E/4MbKaJs4bzXBQAtHWse42rCYyJRSTPqzumoWW+T9ljJfdLA6RXumolhB9
    wyER5CRVl8/5tZTDtpS2TxdDG1YVvTpSsp9zXLj/0bLObSzMwslO49jjid8x9V0rzTjhrr
    /1nqc3OhYqvKSKtcww+B8HF9njUlt33NHHxqDh5GZbbFg7oLAco7Qdz+FFNymwhSNcmX0t
    dgwelP3Lssset2ROHx3H8ozerwWj6MoA5xagzdXKcKV7dIMCsfifsNshs8pVdy2R7QYmxz
    L5JX/ue5AB4nZB7uvGQo+r26kBnFtqsFqch2IvctBhYmNgH/QvehlNgzt2NVP4HosmJkJ6
    J/hrYgmCjcWp7ndLakrlCQJqnWPhAmP6EF60uDWfqikMNrVKUhp0F3BZKBDA
X-ME-Proxy: <xmx:MYebagDH5PPPf5AbYiU5w_KQy30pINEN7gl8vEfZkxwuHrAu3JJ7UQ>
    <xmx:MYebai9x1Oh3wo7gXsr_5QGHnE7b1_sId0uGiy0SSTwZqH9KjRjyAg>
    <xmx:MYebakRnf-Jjm5phiEp2j8B5QEpUZ0Pafk6R0e-ANIH40uSGdjQ10A>
    <xmx:MYebauX2gYmC5GXZEB9AAvshMDv0UYkoFwyd2jqz7NMvLiiICTIKeQ>
    <xmx:MoebankE0J_IYLLeElulh0vqGjeARo2_kgytXvrUYAg9E_OfKF-mlU3j>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 213682C00065; Fri,  4 Sep 2026 23:06:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AYFWDccwDRGw
Date: Fri, 04 Sep 2026 23:06:04 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Hemanth Selam" <hemanth.selam@gmail.com>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net
Message-Id: <e696b6f2-79c7-4db4-8683-77cc740ce156@app.fastmail.com>
In-Reply-To: <20260904113650.18527-1-hemanth.selam@gmail.com>
References: <20260904113650.18527-1-hemanth.selam@gmail.com>
Subject: Re: [PATCH] platform: x86: fix typos in comments
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Sep 4, 2026, at 7:36 AM, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 1661f070c571..bfb292e727c4 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -7069,7 +7069,7 @@ static bool software_mute_active;
>  static int software_mute_orig_mode;
> 
>  /*
> - * Used to syncronize writers to TP_EC_AUDIO and
> + * Used to synchronize writers to TP_EC_AUDIO and
>   * TP_NVRAM_ADDR_MIXER, as we need to do read-modify-write
>   */
>  static struct mutex volume_mutex;
> @@ -7262,7 +7262,7 @@ static int volume_set_software_mute(bool startup)
> 
>  	/*
>  	 * In software mute mode, the standard codec controls take
> -	 * precendence, so we unmute the ThinkPad HW switch at
> +	 * precedence, so we unmute the ThinkPad HW switch at
>  	 * startup.  Just on case there are SAUM-capable ThinkPads
>  	 * with level controls, set max HW volume as well.
>  	 */
> @@ -7981,7 +7981,7 @@ TPACPI_HANDLE(fanw, ec, "FANW",	/* E531 */
>  	   );			/* all others */
> 
>  /*
> - * Unitialized HFSP quirk: ACPI DSDT and EC fail to initialize the
> + * Uninitialized HFSP quirk: ACPI DSDT and EC fail to initialize the
>   * HFSP register at boot, so it contains 0x07 but the Thinkpad could
>   * be in auto mode (0x80).
>   *
> -- 
> 2.48.1
All good.
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
