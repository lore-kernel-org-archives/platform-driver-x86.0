From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] drivers/platform/x86/thinkpad_acpi.c: Handle HKEY event
 0x6040
Date: Thu, 27 Dec 2012 08:38:44 -0200
Message-ID: <20121227103843.GB7894@khazad-dum.debian.net>
References: <1356543973-18459-1-git-send-email-richih.mailinglist@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:47163 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751673Ab2L0Kis (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 27 Dec 2012 05:38:48 -0500
Content-Disposition: inline
In-Reply-To: <1356543973-18459-1-git-send-email-richih.mailinglist@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Richard Hartmann <richih.mailinglist@gmail.com>
Cc: ibm-acpi-devel@lists.sourceforge.net, ibm-acpi@hmh.eng.br, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Wed, 26 Dec 2012, Richard Hartmann wrote:
> +	case TP_HKEY_EV_AC_CHANGED:
> +		pr_info("AC status has changed\n");
> +		/* X120e, x121e, X220, X220i, X220t, X230, T420, T420s, W520:
> +		 * AC status changed; can be triggered by plugging or
> +		 * unplugging AC adapter, docking or undocking, or closing
> +		 * or opening the lid. */
> +		break;
>  
>  	case TP_HKEY_EV_KEY_NUMLOCK:
>  	case TP_HKEY_EV_KEY_FN:

I guess we can drop that pr_info, and please block the issuing of the
event to userspace, like this:

case TP_HKEY_EV_AC_CHANGED:
/* X120e, x121e, X220, X220i, X220t, X230, T420, T420s, W520:
 * AC status changed; can be triggered by plugging or
 * unplugging AC adapter, docking or undocking, or closing
 * or opening the lid. */

/* fallthrough */

and letting it proceed to the TP_HKEY_EV_KEY_NUMLOCK block.

Also, do we have any confirmed reports about the lid switch
causing event 0x6040?  It doesn't look right... the comment
might need to be updated.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
