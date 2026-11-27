Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795750532;
	b=K01yJADkaIdc8rXEvB9JsMu7ka85JXKph7yoONWBCd/90t81r28Ab/9eVq7z2FunXja/
	 z5cr2sFstI9JxDcR69GZJ7gr5NNLnBud4qGMyX3dKKJqNk3BoQGPK0sAfHpCFpxOFYFLU
	 15y+lXhfroITlZWtXYQY+eM0gNvTWjU2Zc721zqRQxeBPKICeZOEjnKnKeOhyfGYFxdqA
	 hfHwAaXnFvNN1rYK+UrQAE4EEfrJzkv4Wqcdl22zubCaql8L7lw11mB6FvAWNgc0RigIz
	 dH1Y5Zap1YPdaTSaYmVtTT6hxkl2t8oWOvUSKvFLkeLHtdz670Rov2EDlittjW/C3uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795750532;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=JP5BLW8HPff1Uro95FNWjlGsV0I9sK9rR+o3aQU9vcc=;
	b=r7vKScaG3QWvEs6Ow/IF5BsaXPq3vXb2alx7yW0tzIBWnWIoS542stauRDKUPtxOdP66
	 xb2vKvqPcrb3jCbliB5Vmfi9j4iKSnGjxGiEIPlzA/KDZzjgv6nA+uCeqiMUjZ8Hn0+qj
	 zBuFamXWVwd4rRtvcPrF+3Io3Jsze1rvIjb91I3VgBvh9R0U4RIZ7Txt985oq2ILzvmno
	 Pz+k6zSKx8eN5dABxjKmfg/zhQAZK6JSEIdbYc/IFAIjVWIhDe9f7/VAYtSE9qA8rA2tv
	 qe3z9VHNFuj2QRMEBglaNI2cg+QTh5yJhsh2UYDL4QYvdLt0Wva/AvDEeYo7WBvUVtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=X6LXmjhA;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=mKvEfeN0;
	arc=none smtp.remote-ip=202.12.124.151
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8E9606A31E
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 03:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C8E9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=X6LXmjhA;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=mKvEfeN0
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.stl.internal (Postfix) with ESMTP id 8BB4D1D00551
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 22:35:31 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Thu, 26 Nov 2026 22:35:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795750531;
	 x=1795836931; bh=JP5BLW8HPff1Uro95FNWjlGsV0I9sK9rR+o3aQU9vcc=; b=
	X6LXmjhA1SeCgxQxjrOuE/T5kAXYA5hIA20fHCU2afSiO1s4wOmBsJ91lpaz1Em8
	drKCE6DcCMrRCCmHPQKRksoIqiwtBLUJhwH+DDPzh4/KijqCILR9/soYuJZrupQh
	1jJUrEMp5YN43JBOepQ5L8kC7YRLhuu33kcpmzHKpOwgDTWLKNvb/J99zQEIf7Xx
	j9yVb7t50Nlojph8H3MPN6Qo6Kblfbe5FSyEq6TIQp9R27oaSu66HygO+enZ6eqi
	WKkP1eA2pbBkVI/nWJPGPoPQxot2SbhcIyNqE2qEN1JJ+ti+c80j9ufxcenDKTVO
	0SDYLIczKj4kdyUNOKWvmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795750531; x=
	1795836931; bh=JP5BLW8HPff1Uro95FNWjlGsV0I9sK9rR+o3aQU9vcc=; b=m
	KvEfeN0MnmTvUdtyX+Rc2Un8gjpAQehW5UWjqkgWKoZw0rZm1kEKKm1bJ9F8TPYa
	BHUwK/BmRA1FRXXreiJecPyQuTfcPk9lV68T/b6hR/iJ/uswVWZF+MaUMu63i2ut
	S1PbelyHENquPRorm7fPzjX7pcIqaNWYMlHvRt65zb1YCIvCMxjVDvs3BFN1BRwK
	rqK1X0JVTNiznY4vLh6g49HuJlNRfDyjOzlIR/FyytlVu1OvFbt6Khg121HSpy24
	+KxItlzCWDFJWs3z5dcEXnsgGik/koDiCFREiaPyXu+ZBUkQnFJs+iSFDddspBOj
	kXmAbVOMJKsXNsCd6Scfg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795750531; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:AT5X0MV6csBPiaxCV6y7H44CxEBo7fuDcwqaLdlek0BHR/z
	ISam9QhDDSSuZktWwoAoehBtFy97K1DYhD0KenB6mvfPhROjCgJlBwYT0GEb+q2c
	XYk/wnNAaf4esF/uvp+gLDcTAV4gUAPTdbLupP7STQkoEotr9TLae4nK6Gktntok
	SJGTt08N0Msq5hsdRSntL7wxu6J/leFXeFnCYGnIku56J5G3FCJAKhHIN4NdWNZd
	vtxhv5k+ovZDCOI2l9DTFd5Hd3/Avyg+2dp0BiYJXc1+HYyPIP0h/ZaQJNpZWoT6
	tsc/B5CG5K9xCPDzsCg8JaZMpGOH9FY0e01lEog==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:VIQIXFups4TOnzs+WzTqxhAJnOBrwMWHP+CCvrp917g=:qJXp77PR2npwMiKcOzw8gDmocse9NrPgMshD6ivTqjE=;
X-ME-Sender: <xms:g_oIa2hLg-Z4rELxZbDlhqUMef1PniXez2eBluKOcQR9hUpYusKlaw>
    <xme:g_oIax1fFas7y_lZP2nB6789p30k8R4ekwEptXZfSW0EmKIiQPnMY7LDYLKpkaGVi
    4-0PpEzILgLyVf6XYs7TLvALN4Pnfq8tlhjPK0HzAYdBakKjwlnlrIK>
X-ME-Proxy-Cause: dmFkZTG01xXJrmqprHWG8VsiOMWao6tIoBjZJv+z/tOB0VVJOQdd3wb80aBasX09ouZT8R
    VbZ4N71HPlJQEbv2QCUOk4UwYTGbXOe6kIawLe5JkXxrBASX+JerCTHUslSveUadCuygLb
    HIUFV8uf7EdIpBdgW/dH7uxlAbB+iiFoXHNxTC3Pldtjo4EqwNkxlzvCXvfZuJtjisQSVB
    UQVn/ow0PpihClCa3wUc3UmoE6dMoXhHmJIQB3quixxKlPWQkE1017XWt0JafqrXX8gbP0
    eFMQpfkql9+IC8mvuQvO36tcNBiWHupe8BtayMU4OyRKYXYubl1mJoHcwdHH9oF4iT1NuE
    tXCqt5bPy2sYakOBwnRtFbekEs6lqc8lQUbTl1iluksgr32dXlMGhQA2D9Uoscj6vkwqJz
    BbxOruFr+1AYv1alGnL8J1M9LSGYFHCRWHk1t/S0M5pWkQ+R9HGp15KLXDjBtaejVbF+qd
    shTQ+HJ7Lkh0Jt0kF6MCP4jfF95YHNxaiV9u1rfktqYN8VDNUAmSCYgNLqhfTdm7ZvpKy+
    w63zg++fM2Y2YYSV8P2YndwrnSwv9AQ8ZtDyPlPrFtngjTa6K4jG1IvxIHguNaFTk4J3L3
    dfBj7F6ceKms1PNXTEgTXhHz9B00Yf9OkB0BQ3goNvXam8w0lwk/C+xR1b4A
X-ME-Proxy: <xmx:g_oIawMdARoCbANpz0AHUfc1sqr1fZ3oMEdHFsKPLDm84EHtXgCrxA>
    <xmx:g_oIa8-DUEQURWxWn2MsgXWPjatdmyfw-h-ilxHS8pmqmGdplXqPMA>
    <xmx:g_oIayGCSAUI7qjncLnQrjA7IypRbMM8d9Y-jzxqCXklU86GATLkfg>
    <xmx:g_oIa7gep7sj9Hur9Bax_wWdlTx8yeEy_97-8d9_ua4R3O9MMawE7g>
    <xmx:g_oIa9E3AxQDNSS5SnBLntMGytjKl3eotM7ulEmf-WvrAclNeGkQzmI5>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 231962C00085; Thu, 26 Nov 2026 22:35:31 -0500 (EST)
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
X-ThreadId: A2P3tcap54Vc
Date: Thu, 26 Nov 2026 22:35:10 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>, "Rong Zhang" <i@rong.moe>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Message-Id: <c741035e-efac-410d-a23e-2ca312826fbf@app.fastmail.com>
In-Reply-To: <20261125-thinkpad-acpi-hotkey-poll-v1-6-6dee57519c2e@gmail.com>
References: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
 <20261125-thinkpad-acpi-hotkey-poll-v1-6-6dee57519c2e@gmail.com>
Subject: Re: [PATCH 6/8] platform/x86: thinkpad_acpi: convert hotkey_thread_data_mutex
 to a spinlock
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Wed, Nov 25, 2026, at 6:11 PM, Dmitry Torokhov wrote:
> hotkey_thread_data_mutex only protects a few in-memory integer reads
> and updates across hotkey_kthread(), tpacpi_hotkey_driver_mask_set(),
> and hotkey_source_mask_store(), with no sleeping calls inside any of
> its critical sections.
>
> Convert it to a statically initialized spinlock_t
> (hotkey_thread_data_lock), which also allows dropping the conditional
> mutex_init() call from hotkey_init().
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 58500b72d9d2..0ebaea0ab96b 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -67,6 +67,7 @@
>  #include <linux/sched/signal.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
> +#include <linux/spinlock.h>
>  #include <linux/string.h>
>  #include <linux/string_choices.h>
>  #include <linux/string_helpers.h>
> @@ -1814,19 +1815,19 @@ struct tp_nvram_state {
>  static struct task_struct *tpacpi_hotkey_task;
> 
>  /*
> - * Acquire mutex to write poller control variables as an
> + * Acquire spinlock to write poller control variables as an
>   * atomic block.
>   *
>   * Increment hotkey_config_change when changing them if you
>   * want the kthread to forget old state.
>   */
> -static struct mutex hotkey_thread_data_mutex;
> +static DEFINE_SPINLOCK(hotkey_thread_data_lock);
>  static unsigned int hotkey_config_change;
> 
>  /*
>   * hotkey poller control variables
>   *
> - * Must be atomic or readers will also need to acquire mutex.
> + * Must be atomic or readers will also need to acquire spinlock.
>   */
>  static u32 hotkey_source_mask;		/* bit mask 0=ACPI,1=NVRAM */
>  static unsigned int hotkey_poll_freq = 10; /* Hz */
> @@ -2143,7 +2144,7 @@ static int tpacpi_hotkey_driver_mask_set(const u32 mask)
>  	guard(mutex)(&hotkey_mutex);
> 
>  #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
> -	scoped_guard(mutex, &hotkey_thread_data_mutex) {
> +	scoped_guard(spinlock, &hotkey_thread_data_lock) {
>  		hotkey_driver_mask = mask;
>  		hotkey_source_mask |= (mask & ~hotkey_all_mask);
>  		hotkey_config_change++;
> @@ -2446,7 +2447,7 @@ static int hotkey_kthread(void *data)
>  	t = 0;
> 
>  	/* Initial state for compares */
> -	scoped_guard(mutex, &hotkey_thread_data_mutex) {
> +	scoped_guard(spinlock, &hotkey_thread_data_lock) {
>  		change_detector = hotkey_config_change;
>  		poll_mask = hotkey_source_mask;
>  		event_mask = hotkey_source_mask &
> @@ -2469,7 +2470,7 @@ static int hotkey_kthread(void *data)
>  		if (t > 0 && !was_frozen)
>  			continue;
> 
> -		scoped_guard(mutex, &hotkey_thread_data_mutex) {
> +		scoped_guard(spinlock, &hotkey_thread_data_lock) {
>  			if (was_frozen ||
>  			    hotkey_config_change != change_detector) {
>  				/* forget old state on thaw or config change */
> @@ -2726,7 +2727,7 @@ static ssize_t hotkey_source_mask_store(struct 
> device *dev,
>  	if (rc)
>  		return rc;
> 
> -	scoped_guard(mutex, &hotkey_thread_data_mutex) {
> +	scoped_guard(spinlock, &hotkey_thread_data_lock) {
>  		hotkey_source_mask = t;
>  		hotkey_config_change++;
>  	}
> @@ -3329,10 +3330,6 @@ static int __init hotkey_init(struct 
> ibm_init_struct *iibm)
>  	TPACPI_ACPIHANDLE_INIT(hkey);
>  	mutex_init(&hotkey_mutex);
> 
> -#ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
> -	mutex_init(&hotkey_thread_data_mutex);
> -#endif
> -
>  	/* hotkey not supported on 570 */
>  	tp_features.hotkey = hkey_handle != NULL;
> 
>
> -- 
> 2.56.1.839.g22a8290db9-goog

I think this is all fine and a good change. Hopefully some more experienced eyes confirm there aren't any issues that I'm not thinking of.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
mark
