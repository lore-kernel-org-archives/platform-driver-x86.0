Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1781154432
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Apr 2024 19:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713814016; cv=none; b=IM8JkkiIp8stMssc1nZuLncONPBsp5Z3ZHVWhhB6mrGIrrME9zEaoNda1i+0kg+OHocnz3uuklAhUHIHmhl/43DhccyxdX5cXXeeBTmn0DYXZtCUS6p+72R/cYhHxqIJVD8coRwVNKMsfMstFgjjjJScMizeg7mlrVfi1Kouzyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713814016; c=relaxed/simple;
	bh=qppCbMLuwn3RN217L2g7WdS18XXq2xh7f0xGtZgi+AI=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=A0On5ppzf8O+HCnBuBH6GbpMJY8rQgM5MV9Po+bEFTsKQwgrK+mLEyDRM1sRQFweFWrVcaFHgG4sHCBB2e2QtpSp3VatHj9YC/r7IgO/+bhJYH1YEk7ZmnTTrdWw/1l2qjez0uXJ4Pt7e3yArUHBN/iWU5NyBONU7/X5bzOZRPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=qx43R/do; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bfMkzJ6p; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="qx43R/do";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bfMkzJ6p"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id C14FA1140162;
	Mon, 22 Apr 2024 15:26:53 -0400 (EDT)
Received: from imap52 ([10.202.2.102])
  by compute3.internal (MEProxy); Mon, 22 Apr 2024 15:26:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1713814013; x=1713900413; bh=epFoKf6p/a
	CRzPAG8G6J2M3Im3XKhBimZGrp8d8YQt0=; b=qx43R/do1L8z26Z4oFdgJrjaNR
	gQRk1j+vvr0LjUXYCfDy1z/xDc+PS7P/5UaVncUUrOvM6qJmObEHfaltP01vMn5Y
	yCCrV+2GtL48sedCmYZ0n9vfZOTaf5jXmvEfEkOEEPPdwYlTVOTC/VikcIMp4DHq
	lV2W/C3E21YB1rT9QwycDRVn3aXEfmuE7ctJ4x5+X6eJQ1qalVtL7RrWRxqgIAkF
	i3uGtUwQ3Mv1O7QMPURUFYEcwuVsqyaHngoOvcwGXiVwta2kdp4p/JcSWRNEDDBx
	CsPE3vCHG0W039csd6YATxuB6lKHAWk4xCgobB69fpo3eytkedNy5k9D0qog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1713814013; x=1713900413; bh=epFoKf6p/aCRzPAG8G6J2M3Im3XK
	hBimZGrp8d8YQt0=; b=bfMkzJ6pVkZbZOrGVN79z7eV6QTaMJbq+0NPuktyMD1L
	51Qb2EjwBRpjdSdLZ8cKgtSUxYC2b2ekdZHSvtDCdiOdM5Pd+WP6x5Zag3PChQy9
	xGnM9FZKOEMnViz/eRJzgdpK8O8LaVnz/6T/SdPf8P6SBabEE5lHOGhUGLncILxA
	5HoMd5XnqlXvbRGAVQcpuAfJym1UGfa7DRAfnnivX8tRbI9sPl6JeCEKCVWUExrM
	1QGFXltVFu52QnC/YbdW4HayHlB5tKUXf74YJEFFqDVdVL23uoS9tkjtN7aL9b7X
	UnORfbl5UoUArG074ChuEY8uozwp6+CS8Xy1XN18Rg==
X-ME-Sender: <xms:_LkmZizQM98d5bZR0hX5eFbLhA6YogybAwPKkmonZ09WujMeJrMXkg>
    <xme:_LkmZuRGne7i0rSnqk1SP0sUBJ6X8ZLZH8Bqk0fDC4M_yYBIyyaMopYHnwSLVu23n
    z5ZX5s9edVbfEUnil8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudekledgudefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfo
    rghrkhcurfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsg
    gsrdgtrgeqnecuggftrfgrthhtvghrnhepieeufeejieevteduvdekteefledtveffvedu
    hefffeejudefvdeijeegudegkefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgt
    rg
X-ME-Proxy: <xmx:_LkmZkVfOPB79Ch4Ra-fSIESQAc05y6_IXrA0VC4ku9lV9ucbauoUA>
    <xmx:_LkmZoj6F9woZfJvfdW5KFsng6Kdn5uf0f6qdyiKTe3Wyw2cwaSwWQ>
    <xmx:_LkmZkCg72L_GKqvA5FY88TkPvU8q-jBBMtHxpdQ6R2Pj4HosDZP4A>
    <xmx:_LkmZpJX5yX3nq28cMkfkwn0BY-ZyZyLKpWPm8zyqRI4CvVtMu2AbQ>
    <xmx:_bkmZiBSNmITWf7deqC2IZ7fr9zlIjirYCo7bkKgdqdmJLkurts4GGK0>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C94E7C60099; Mon, 22 Apr 2024 15:26:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-386-g4cb8e397f9-fm-20240415.001-g4cb8e397
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <3b8a783f-eeaf-4f30-8a12-57c14f51bfc5@app.fastmail.com>
In-Reply-To: <20240421154520.37089-9-hdegoede@redhat.com>
References: <20240421154520.37089-1-hdegoede@redhat.com>
 <20240421154520.37089-9-hdegoede@redhat.com>
Date: Mon, 22 Apr 2024 15:27:42 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Andy Shevchenko" <andy@kernel.org>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>
Cc: "Vishnu Sankar" <vishnuocv@gmail.com>,
 "Nitin Joshi1" <njoshi1@lenovo.com>, ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH 08/24] platform/x86: thinkpad_acpi: Move adaptive kbd event
 handling to tpacpi_driver_event()
Content-Type: text/plain

Hi Hans,

On Sun, Apr 21, 2024, at 11:45 AM, Hans de Goede wrote:
> Factor out the adaptive kbd non hotkey event handling into
> adaptive_keyboard_change_row() and adaptive_keyboard_s_quickview_row()
> helpers and move the handling of TP_HKEY_EV_DFR_CHANGE_ROW and
> TP_HKEY_EV_DFR_S_QUICKVIEW_ROW to tpacpi_driver_event().
>
> This groups all the handling of hotkey events which do not emit
> a key press event together in tpacpi_driver_event().
>
> This is a preparation patch for moving to sparse-keymaps.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 85 +++++++++++++++-------------
>  1 file changed, 45 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c 
> b/drivers/platform/x86/thinkpad_acpi.c
> index 0bbc462d604c..e8d30f4af126 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -3677,51 +3677,50 @@ static int adaptive_keyboard_get_next_mode(int 
> mode)
>  	return adaptive_keyboard_modes[i];
>  }
> 
> +static void adaptive_keyboard_change_row(void)
> +{
> +	int mode;
> +
> +	if (adaptive_keyboard_mode_is_saved) {
> +		mode = adaptive_keyboard_prev_mode;
> +		adaptive_keyboard_mode_is_saved = false;
> +	} else {
> +		mode = adaptive_keyboard_get_mode();
> +		if (mode < 0)
> +			return;
> +		mode = adaptive_keyboard_get_next_mode(mode);
> +	}
> +
> +	adaptive_keyboard_set_mode(mode);
> +}
> +
> +static void adaptive_keyboard_s_quickview_row(void)
> +{
> +	int mode = adaptive_keyboard_get_mode();
> +
> +	if (mode < 0)
> +		return;
> +
> +	adaptive_keyboard_prev_mode = mode;
> +	adaptive_keyboard_mode_is_saved = true;
> +
> +	adaptive_keyboard_set_mode(FUNCTION_MODE);
> +}
> +
>  static bool adaptive_keyboard_hotkey_notify_hotkey(const u32 hkey)
>  {
> -	int current_mode = 0;
> -	int new_mode = 0;
> -
> -	switch (hkey) {
> -	case TP_HKEY_EV_DFR_CHANGE_ROW:
> -		if (adaptive_keyboard_mode_is_saved) {
> -			new_mode = adaptive_keyboard_prev_mode;
> -			adaptive_keyboard_mode_is_saved = false;
> -		} else {
> -			current_mode = adaptive_keyboard_get_mode();
> -			if (current_mode < 0)
> -				return false;
> -			new_mode = adaptive_keyboard_get_next_mode(
> -					current_mode);
> -		}
> -
> -		if (adaptive_keyboard_set_mode(new_mode) < 0)
> -			return false;
> -
> +	if (tpacpi_driver_event(hkey))
>  		return true;
> 
> -	case TP_HKEY_EV_DFR_S_QUICKVIEW_ROW:
> -		current_mode = adaptive_keyboard_get_mode();
> -		if (current_mode < 0)
> -			return false;
> -
> -		adaptive_keyboard_prev_mode = current_mode;
> -		adaptive_keyboard_mode_is_saved = true;
> -
> -		if (adaptive_keyboard_set_mode (FUNCTION_MODE) < 0)
> -			return false;
> -		return true;
> -
> -	default:
> -		if (hkey < TP_HKEY_EV_ADAPTIVE_KEY_START ||
> -		    hkey > TP_HKEY_EV_ADAPTIVE_KEY_END) {
> -			pr_info("Unhandled adaptive keyboard key: 0x%x\n", hkey);
> -			return false;
> -		}
> -		tpacpi_input_send_key(hkey - TP_HKEY_EV_ADAPTIVE_KEY_START +
> -				      TP_ACPI_HOTKEYSCAN_ADAPTIVE_START);
> -		return true;
> +	if (hkey < TP_HKEY_EV_ADAPTIVE_KEY_START ||
> +	    hkey > TP_HKEY_EV_ADAPTIVE_KEY_END) {
> +		pr_info("Unhandled adaptive keyboard key: 0x%x\n", hkey);
> +		return false;
>  	}
> +
> +	tpacpi_input_send_key(hkey - TP_HKEY_EV_ADAPTIVE_KEY_START +
> +			      TP_ACPI_HOTKEYSCAN_ADAPTIVE_START);
> +	return true;
>  }
> 
>  static bool hotkey_notify_extended_hotkey(const u32 hkey)
> @@ -11117,6 +11116,12 @@ static bool tpacpi_driver_event(const unsigned 
> int hkey_event)
>  		}
>  		/* Key events are suppressed by default hotkey_user_mask */
>  		return false;
> +	case TP_HKEY_EV_DFR_CHANGE_ROW:
> +		adaptive_keyboard_change_row();
> +		return true;
> +	case TP_HKEY_EV_DFR_S_QUICKVIEW_ROW:
> +		adaptive_keyboard_s_quickview_row();

Was there a reason to get rid of error handling that was previously done with adaptive_keyboard_set_mode and is now not used here?

> +		return true;
>  	case TP_HKEY_EV_THM_CSM_COMPLETED:
>  		lapsensor_refresh();
>  		/* If we are already accessing DYTC then skip dytc update */
> -- 
> 2.44.0

Thanks
Mark
