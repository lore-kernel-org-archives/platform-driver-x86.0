From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] toshiba_bluetooth: Decouple an error checking status code
Date: Fri, 23 Sep 2016 16:19:47 -0700
Message-ID: <20160923231947.GC27846@f23x64.localdomain>
References: <20160907152815.5950-1-coproscefalo@gmail.com>
 <20160907152815.5950-4-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:39631 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1761517AbcIWXTs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 23 Sep 2016 19:19:48 -0400
Content-Disposition: inline
In-Reply-To: <20160907152815.5950-4-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Sep 07, 2016 at 09:28:15AM -0600, Azael Avalos wrote:
> This patch simply decouples te error checking of the ACPI status and
> the actual BT status, as those two were nested in an if/else check,
> but are completely unrelated.
> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>

Queued, thanks.

-- 
Darren Hart
Intel Open Source Technology Center
