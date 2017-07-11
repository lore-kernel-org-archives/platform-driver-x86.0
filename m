From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: peaq-wmi: Fix peaq_ignore_events_counter
 handling off by 1
Date: Tue, 11 Jul 2017 09:13:33 -0700
Message-ID: <20170711161333.GD25390@fury>
References: <20170711114134.6706-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:59461 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932758AbdGKQNv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jul 2017 12:13:51 -0400
Content-Disposition: inline
In-Reply-To: <20170711114134.6706-1-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jul 11, 2017 at 01:41:34PM +0200, Hans de Goede wrote:
> If peaq_ignore_events_counter gets set to 1 we should skip polling 1
> time, rather then ignoring it.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Thanks Hans, queued to testing.

-- 
Darren Hart
VMware Open Source Technology Center
