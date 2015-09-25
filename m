From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] toshiba_acpi: Remove unneeded u32 variables from
 *setup_keyboard
Date: Fri, 25 Sep 2015 17:37:53 +0200
Message-ID: <20150925153753.GA38748@vmdeb7>
References: <1442637935-5136-1-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:51882 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932263AbbIYPh6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 25 Sep 2015 11:37:58 -0400
Content-Disposition: inline
In-Reply-To: <1442637935-5136-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Sep 18, 2015 at 10:45:34PM -0600, Azael Avalos wrote:
> The function toshiba_acpi_setup_keyboard currently has two u32 variables
> used to store the Hotkey Event Type and the result of the HCI_SYSTEM_EVENT
> query.
> 
> This patch removes those two variables, as we already have a global
> variable named "hotkey_event_type" and the result of the HCI_SYSTEM_EVENT
> query can be checked directly from the function.
> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>

Applied, thanks Azael.
-- 
Darren Hart
Intel Open Source Technology Center
