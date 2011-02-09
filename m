From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] Platform: add Samsung Laptop platform driver
Date: Wed, 9 Feb 2011 22:50:56 +0000
Message-ID: <20110209225056.GA25009@srcf.ucam.org>
References: <20110209224006.GA11202@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:37097 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751792Ab1BIWvI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 9 Feb 2011 17:51:08 -0500
Content-Disposition: inline
In-Reply-To: <20110209224006.GA11202@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Randy Dunlap <rdunlap@xenotime.net>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

\o/

A quick glance suggests that the firmware interface is an abomination 
and really there's no reason for them not to have used an existing 
interface of some sort, but that's par for the course. I'll review it 
properly now.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
