From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 3/6] toshiba_bluetooth: Clean toshiba_bluetooth_enable
 function
Date: Sun, 3 May 2015 12:43:36 -0700
Message-ID: <20150503194336.GD16105@fury.dvhart.com>
References: <1430166770-15060-1-git-send-email-coproscefalo@gmail.com>
 <1430166770-15060-4-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:51488 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751491AbbECTnh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 3 May 2015 15:43:37 -0400
Content-Disposition: inline
In-Reply-To: <1430166770-15060-4-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Apr 27, 2015 at 02:32:47PM -0600, Azael Avalos wrote:
> This patch removes unneeded code from the toshiba_bluetooth_enable
> function as propper rfkill code as been added now.
> 

Seems like this should just be part of 2 of 3 since it essentially moves the
status code?

-- 
Darren Hart
Intel Open Source Technology Center
