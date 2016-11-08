From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH v3 1/3] thinkpad_acpi: Move tablet detection into
 separate function
Date: Tue, 8 Nov 2016 08:50:05 -0200
Message-ID: <20161108105004.GA8609@khazad-dum.debian.net>
References: <1478538633-11450-1-git-send-email-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:49568 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932306AbcKHKuK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Nov 2016 05:50:10 -0500
Content-Disposition: inline
In-Reply-To: <1478538633-11450-1-git-send-email-lyude@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Lyude <lyude@redhat.com>
Cc: ibm-acpi-devel@lists.sourceforge.net, Daniel Martin <consume.noise@gmail.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 07 Nov 2016, Lyude wrote:
> @@ -3117,6 +3120,34 @@ static const struct tpacpi_quirk tpacpi_hotkey_qtable[] __initconst = {
>  typedef u16 tpacpi_keymap_entry_t;
>  typedef tpacpi_keymap_entry_t tpacpi_keymap_t[TPACPI_HOTKEY_MAP_LEN];
>  
> +static int
> +hotkey_init_tablet_mode(void)
> +{

Function definiton all in one line, please.

Provided that you fix that minor nit,

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

-- 
  Henrique Holschuh
