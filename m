Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FA24BAA17
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 18:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792090294; cv=none; b=i0S09WOMtFgekDxPfY1s3qYh+zQ6vy6YgCqoEmaSymL5uSblmVCjsA9NoZ6vH3/f/8aaRwAMhI0YlBXVCZuYtIEhh+Vyzv3u97XK5WZ+OCUw2NEeS9HWglzN7bCM9pNT0zInDaQZKaitWEOl1JvqfsiSTs5kF+WQnu4Yuv3/BBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792090294; c=relaxed/simple;
	bh=HO1HSxlzu9A5G2X9wPBaDiKRVbCJ2afCF/bqWtwhDas=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=cqSOVK1/bIX6dTEgRXrU1Qv31urdq6kYKKlR8FGA8ewmTsENwrDXhwfMj7AiRHdTZE8bNCenEdzXf/1jsmPjld25kEhf7rGXDhWWEx0RmIsMyllmvixwfYUQL3xFNEAl4U1xuvo7dqnmFVgaYhO5kJKvtZKZOCPlgiImfFUxAD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=Aqv7ZblO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=K8iVxa37; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="Aqv7ZblO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="K8iVxa37"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.stl.internal (Postfix) with ESMTP id A85551D000D1
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 14:51:30 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Thu, 15 Oct 2026 14:51:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1792090290;
	 x=1792176690; bh=Ak/8qLCT2PjpEnH+ZxC6P3NqP2TXS/ckhKWICHxOvgU=; b=
	Aqv7ZblO+0cPVPEaiLnbQ8QpJhd8290zA3l0wST60vrThluQxdsZj6dxqE6B+dgF
	rdwBhI+7Pm+GKEb9RauV0y4oOnjMHVlRkrtugV7440aBvjb3mSBkuz6cG+Q83cJ5
	CymWp/BKQBbEIgmsvNsjGtwZwYAHJnQz0qjnu3rzinDJ7Jx1sDT2Zas44i2aBHwy
	CE+ak+UHAm5SxbhftKUWVs6rcMAlvUleE1C4AhNcN/Yd0KNZO+RCjY6FB2QgSQzy
	cHUx/iNs5omgnfCvRUWnKYg0pSoraZDzFQ3RMAEdLZ08AMbrSlI706kTwHEDD+NB
	V96KIEx9YB1HW8LDC63UHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792090290; x=
	1792176690; bh=Ak/8qLCT2PjpEnH+ZxC6P3NqP2TXS/ckhKWICHxOvgU=; b=K
	8iVxa37fp76mqum9WD7lFtWQZuxH8XgckFftkDK0xFR5nDmrceOgmg4C6WfYBK0V
	TT9meq+3jNPEMGI1xtmwrMo/KrpO4BQCbRYlbSOEhx1De1xe9s8S9yzvh6JqyjJ7
	X+HSpttp9BmGDe18qmkb7q48c25F7gEmmguJfcN0oENzRWAefigFcnoOOUPUk9Vf
	OWGx50okiqdnIq16UI/54jWzJAI/yuJVS8o0xp3Vt8NvLv2IMh2mXs7KmpGSjQkC
	sGZSxN2D+Jd6IU3A9V/hO4I7nbq7njabs+o51XSMlvn7BKkJ631p/CHYAOU82YAW
	7bKbH3iyQ19hb1YuB/URQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792090290; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm3:rsa-sha256:LeAhNfpS1Xyo7H0pNcY13QpAMOBK6evXOwj6mz73L6MiFju
	j/nFoW1qY/z6XQ4uuK4YUDpUVlJIxF/GHOQ0ptcz+Cfk9Ss5x4xPKK/sMq8tkD04
	7aqeJFdD2V/EMXj0bjc6opxvAQRhO54YQ+801OFWTtUGkYmAxnlUj7PAZD+tjMbt
	bt51lxwcWSGLlIXZ3sn8vZYmFZXXeJSCLw8k2NIPmPEN44a6GOhBkAXrb7vLCVC7
	tQnTe2F6hp0+XgGwbXzLP3f4he5mnHL0obCMd9EWHI+cHf501moQ8Ugt44Xhldyd
	LNfQtUmYDygC+x9rH4zm9dKWZQ4KjQgjgArcHiQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:icwcS713CIvdgv3vuK+D6MjjIcy6OKrWK6NTgWXlmQI=:HO1HSxlzu9A5G2X9wPBaDiKRVbCJ2afCF/bqWtwhDas=;
X-ME-Sender: <xms:siDRaoqHhn622_yJV3Ckw2PV9-C1BdhCuWk5WYjWRZU79esxvLWU_w>
    <xme:siDRapeF1DcjK_QfAttec-XHEToNSZYddXklKCUr54D2X0_Pmr_c8hDvLpnLYmg-Z
    k5OW8X5SCu7VOuDsC-r53UwoF2wiTbHJ00w6gIIUJ5YiFJBpo5_zo4>
X-ME-Proxy-Cause: dmFkZTE53mLJCWNWPmDHNOcqMbRTaWDW8YKjRyQvGoaiKC/D9+WY1ugvGuGxpIjuTxaCJl
    eCWGV0NpTv1mTsFZOzFOz64H6B9hK6WJ1hatDkyQcD4Tqvp1Drk05Yl46YlBgvsTTRmbJf
    hvHluibKE6T3PLcHTd1gJMWboCdio6JuLc1BW/dxOk6lrSfHXgx2bkzUqU8nvt2Lak/N7c
    QG9cjAD4rxTzojuyzLA5gnfUA4MEAYa0xYkPn/SsyKG6boRekM7gwR+gFH1WEfGRRzQVdt
    8Pwtwzy6q2IC088nGXZM2jG8DMPttySbWEzhI4qHCuGs4zjnLVYoIu2ZG5GI2fEbNMzyMn
    mI267HD/AsJJO6K6CJ5QCjzkobxXOKBtDHoarzTtPVt9hUAuzotAQPSoKNRSQAE7kWk5kE
    sCJZt19GZ5V3aSKiwbgyamfn3Nt9DWcjSS9m4ZwsUpZH9HmJY3IjFpajRH4jgQQIh4kInX
    YT7vrGKb6vftxF9EfaMyCAaxXWYTP1OL8gW1g5XmLJSDdL3Hfj+1h3A/5qUdMS9zHYzNED
    Mxu/rqUoxgw4OvfjUXSOXuDscvHFywXRG6yDmGAucWl4SteLA2RHhRqEJK6pUoSOhLy1Ao
    jsfIDDjzoaBW3tsnBs7s2Ir0LRNZxhCLo4+ps+XCNF7/H831BV591R2+BJ7A
X-ME-Proxy: <xmx:siDRanI391SV3Ij-9Lt_o8e9UxK2uaO1AQMme5UXN5sIYrwmwy962w>
    <xmx:siDRanvu9rm7eUlPJmyhflNqXx3XZppPzWIQAICLlLaVt5UlGmzdpg>
    <xmx:siDRakJFcP-IjAyWD3a3KCjMLWR8zVc2_oL3P5kpu0iIbMP3wp39Sw>
    <xmx:siDRanPKU-ZXZ1D7y4A26jmeoUtU3KMj2vFRL3NwZuo85vtz7UULAQ>
    <xmx:siDRau1OtH5RMRzqVDsnn4o2l1evxlcdQ74ls_xfzWFd2DcfUSTnzMaT>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id EDB842C0007C; Thu, 15 Oct 2026 14:51:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AAiu7TaDoMPk
Date: Thu, 15 Oct 2026 14:51:09 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Armin Wolf" <W_Armin@gmx.de>
Cc: Charles <hanker007@gmail.com>,
 "Navon John Lukose" <navonjohnlukose@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <4362df6c-329a-4419-8c1c-7202cf934dc4@app.fastmail.com>
In-Reply-To: <20261014-lwmi-wmi-new-api-v3-7-e1032bed1c81@rong.moe>
References: <20261014-lwmi-wmi-new-api-v3-0-e1032bed1c81@rong.moe>
 <20261014-lwmi-wmi-new-api-v3-7-e1032bed1c81@rong.moe>
Subject: Re: [PATCH v3 07/12] platform/x86: lenovo-wmi-capdata: Adopt new WMI API
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Tue, Oct 13, 2026, at 3:21 PM, Rong Zhang wrote:
> The new WMI API supports multiple ACPI types by converting them into a
> unified buffer that satisfies alignment and size requirements.
>
> Adopt it to make our life easier.
>
> Note that the new WMI API only accepts a few ACPI types to conform to
> the behavior of the Windows WMI-ACPI driver. By adopting the new API, we
> intentionally rejects improper ACPI types instead of silently ignoring
> them.
>
> Meanwhile, considering that `struct_size(block, data, count * 3)' may
> overflow when calculating `count * 3', ignore Fan Test Data with count >
> U8_MAX instead of caping `count'.
>

Minor typo: caping -> capping

> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Tested-by: Navon John Lukose <navonjohnlukose@gmail.com>
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
> Changes in v3:
> - Leave struct cd_fan_block's __packed attribute as is (thanks Armin
>   Wolf)
> ---
>  drivers/platform/x86/lenovo/wmi-capdata.c | 70 ++++++++++++++-----------------
>  1 file changed, 31 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c 
> b/drivers/platform/x86/lenovo/wmi-capdata.c
> index 3c09bb9e3d46..abf5ffda7163 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> @@ -626,17 +626,19 @@ static int __lwmi_cd_cache(struct lwmi_cd_priv 
> *priv)
>  	}
> 
>  	for (idx = 0; idx < priv->list->count; idx++, p += size) {
> -		union acpi_object *ret_obj __free(kfree) = NULL;
> +		struct wmi_buffer wbuf;
> +		int ret;
> 
> -		ret_obj = wmidev_block_query(priv->wdev, idx);
> -		if (!ret_obj)
> -			return -ENODEV;
> -
> -		if (ret_obj->type != ACPI_TYPE_BUFFER ||
> -		    ret_obj->buffer.length < size)
> +		ret = wmidev_query_block(priv->wdev, idx, &wbuf, size);
> +		if (ret == -ENODATA) /* The block is too short, probably stubbed. */
>  			continue;
> +		if (ret)
> +			return ret;
> +
> +		/* Capdata 01 is an extension to capdata 00. */
> +		struct capdata00 *capdata __free(kfree) = wbuf.data;
> 
> -		memcpy(p, ret_obj->buffer.pointer, size);
> +		memcpy(p, capdata, size);
>  	}
> 
>  	return 0;
> @@ -678,43 +680,34 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
>   */
>  static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv)
>  {
> +	struct wmi_buffer wbuf;
>  	struct cd_list *list;
> -	size_t size;
> +	int ret, idx;
>  	u32 count;
> -	int idx;
> 
> -	/* Emit unaligned access to u8 buffer with __packed. */
>  	struct cd_fan_block {
>  		u32 nr;
>  		u32 data[]; /* id[nr], max_rpm[nr], min_rpm[nr] */
> -	} __packed * block;
> +	} __packed;
> 
> -	union acpi_object *ret_obj __free(kfree) = wmidev_block_query(priv->wdev, 0);
> -	if (!ret_obj)
> -		return -ENODEV;
> +	ret = wmidev_query_block(priv->wdev, 0, &wbuf, sizeof(struct cd_fan_block));
> +	if (ret == -ENODATA) /* The block is too short, probably stubbed. */
> +		return 0;
> +	if (ret)
> +		return ret;
> 
> -	if (ret_obj->type == ACPI_TYPE_BUFFER) {
> -		block = (struct cd_fan_block *)ret_obj->buffer.pointer;
> -		size = ret_obj->buffer.length;
> +	struct cd_fan_block *block __free(kfree) = wbuf.data;
> 
> -		count = size >= sizeof(*block) ? block->nr : 0;
> -		if (size < struct_size(block, data, count * 3)) {
> -			dev_warn(&priv->wdev->dev,
> -				 "incomplete fan test data block: %zu < %zu, ignoring\n",
> -				 size, struct_size(block, data, count * 3));
> -			count = 0;
> -		} else if (count > U8_MAX) {
> -			dev_warn(&priv->wdev->dev,
> -				 "too many fans reported: %u > %u, truncating\n",
> -				 count, U8_MAX);
> -			count = U8_MAX;
> -		}
> -	} else {
> -		/*
> -		 * This is usually caused by a dummy ACPI method. Do not return an error
> -		 * as failing to probe this device will result in sub-master device being
> -		 * unbound. This behavior aligns with lwmi_cd_cache().
> -		 */
> +	count = block->nr;
> +
> +	if (count > U8_MAX) {
> +		dev_warn(&priv->wdev->dev,
> +			 "too many fans reported: %u > %u, ignoring\n", count, U8_MAX);
> +		count = 0;
> +	} else if (wbuf.length < struct_size(block, data, count * 3)) {
> +		dev_warn(&priv->wdev->dev,
> +			 "incomplete fan test data block: %zu < %zu (%u fans), ignoring\n",
> +			 wbuf.length, struct_size(block, data, count * 3), count);
>  		count = 0;
>  	}
> 
> @@ -729,11 +722,10 @@ static int lwmi_cd_fan_list_alloc_cache(struct 
> lwmi_cd_priv *priv)
>  	priv->list = list;
> 
>  	for (idx = 0; idx < count; idx++) {
> -		/* Do not calculate array index using count, as it may be truncated. */
>  		list->cd_fan[idx] = (struct capdata_fan) {
>  			.id      = block->data[idx],
> -			.max_rpm = block->data[idx + block->nr],
> -			.min_rpm = block->data[idx + (2 * block->nr)],
> +			.max_rpm = block->data[idx + count],
> +			.min_rpm = block->data[idx + (2 * count)],
>  		};
>  	}
> 
>
> -- 
> 2.55.0

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
