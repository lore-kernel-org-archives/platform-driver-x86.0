From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: [PATCH] classmate-laptop: should check for NULL as retval for
 rfkill_alloc
Date: Wed, 09 Jun 2010 21:46:17 +0200
Message-ID: <1276112777.14580.24.camel@jlt3.sipsolutions.net>
References: <20100609185803.GB2551@barata.holoscopio.com>
	 <1276112368-3057-1-git-send-email-cascardo@holoscopio.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from he.sipsolutions.net ([78.46.109.217]:38314 "EHLO
	sipsolutions.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932219Ab0FITqY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 9 Jun 2010 15:46:24 -0400
In-Reply-To: <1276112368-3057-1-git-send-email-cascardo@holoscopio.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
Cc: alan-jenkins@tuffmail.co.uk, platform-driver-x86@vger.kernel.org, mjg@redhat.com, don@syst.com.br, rpurdie@rpsys.net

On Wed, 2010-06-09 at 16:39 -0300, Thadeu Lima de Souza Cascardo wrote:

> +	/*
> +	 * If RFKILL is disabled, rfkill_alloc will return ERR_PTR(-ENODEV).
> +	 * This is OK, however, since all other uses of the device will not
> +	 * derefence it.
> +	 */
> +	if (!ipml->rf) {

the ! shouldn't be there

johannes

