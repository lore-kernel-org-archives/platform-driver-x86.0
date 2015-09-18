From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/1] toshiba_acpi: Add 0x prefix to
 available_kbd_modes_show funtion
Date: Fri, 18 Sep 2015 14:53:29 -0700
Message-ID: <20150918215329.GL66179@vmdeb7>
References: <1441819810-11762-1-git-send-email-coproscefalo@gmail.com>
 <1441819810-11762-2-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:51904 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754553AbbIRVxb (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 Sep 2015 17:53:31 -0400
Content-Disposition: inline
In-Reply-To: <1441819810-11762-2-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Sep 09, 2015 at 11:30:09AM -0600, Azael Avalos wrote:
> This patch adds the 0x prefix to the values printed by such function, the
> values are already being printed in hex, but without the prefix, causing
> confussion, even though the file under Documentation/ABI clearly states
> that hey are hex values.
> 
> Simply add the 0x prefix to avoid such confussion.
> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>

Queued to testing for 4.4.

-- 
Darren Hart
Intel Open Source Technology Center
