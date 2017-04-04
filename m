From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 00/11] fujitsu-laptop: backlight cleanup
Date: Mon, 3 Apr 2017 18:18:10 -0700
Message-ID: <20170404011810.GB16584@fury>
References: <20170330103509.32509-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:43167 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751362AbdDDBSM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Apr 2017 21:18:12 -0400
Content-Disposition: inline
In-Reply-To: <20170330103509.32509-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Mar 30, 2017 at 12:34:58PM +0200, Michał Kępień wrote:
> This series introduces further changes to the way LCD backlight is
> handled by fujitsu-laptop.  These changes include fixing a bug in code
> responsible for generating brightness-related input events, cleaning up
> handling of module parameters, reducing code duplication, removing
> superfluous debug messages and other fixes.
> 
> This series was tested on a Lifebook S7020 and a Lifebook E744.
> 
> This series is based on the testing branch as it requires earlier patch
> series I submitted in order to apply cleanly.

Other than the rather minor nit to 4/11, I've reviewed this series and feel it's
ready to go. If you would like to resend 4/11 in response to that specific
patch, I can just pick it up and get it queued and tested while we await a
review from Jonathan.

Again, nice work.

-- 
Darren Hart
VMware Open Source Technology Center
