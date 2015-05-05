From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2 3/5] toshiba_acpi: Cleanup blank lines after comment
 blocks
Date: Tue, 05 May 2015 07:18:40 -0700
Message-ID: <1430835520.7191.14.camel@perches.com>
References: <1430759758-4026-1-git-send-email-coproscefalo@gmail.com>
	 <1430759758-4026-4-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtprelay0087.hostedemail.com ([216.40.44.87]:42491 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S2993169AbbEEOYH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 5 May 2015 10:24:07 -0400
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave02.hostedemail.com (Postfix) with ESMTP id DC5514199
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 May 2015 14:18:43 +0000 (UTC)
In-Reply-To: <1430759758-4026-4-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2015-05-04 at 11:15 -0600, Azael Avalos wrote:
> This patch removes some blank lines after comment blocks, capitalizes
> some comments first words and adds a few comments to the beggining
> of some functions.

I think blank lines after comments are generally OK.

This is now inconsistent about 

/*
 * short comment
 */

and

/* short comment */

Not all function blocks need introductory comments.

> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
[]
> @@ -78,10 +78,9 @@ MODULE_LICENSE("GPL");
>   * SCI stands for "System Configuration Interface" which aim is to
>   * conceal differences in hardware between different models.
>   */
> -
>  #define TCI_WORDS			6

It's sometimes nice to have blank lines after long
block comments.
 
> -/* operations */
> +/* Operations */

I think these sentence case changes aren't better.
