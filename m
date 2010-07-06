From: Thomas Renninger <trenn@suse.de>
Subject: Re: [PATCH] hp-wmi: add return value checking for input_allocate_device()
Date: Tue, 6 Jul 2010 10:11:14 +0200
Message-ID: <201007061011.15205.trenn@suse.de>
References: <1278383426.12801.15.camel@mola> <201007060956.45726.trenn@suse.de> <AANLkTimpkmAoPep9s1Hp5gZvdjzDm_1iBO32xYeAQL5F@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:44567 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751625Ab0GFILR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 6 Jul 2010 04:11:17 -0400
In-Reply-To: <AANLkTimpkmAoPep9s1Hp5gZvdjzDm_1iBO32xYeAQL5F@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: axel.lin@gmail.com
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Matthew Garrett <mjg@redhat.com>, Len Brown <len.brown@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Frans Pop <elendil@planet.nl>, Anisse Astier <anisse@astier.eu>, platform-driver-x86@vger.kernel.org

On Tuesday 06 July 2010 10:07:49 Axel Lin wrote:
> hi Thomas,
> 2010/7/6 Thomas Renninger <trenn@suse.de>:
...
> > Do you mind to incorporate above if you agree.
> 
> Checking hp_wmi_input_setup() is already done in my previous patch.
> ( which is already merged in platform-driver-x86 tree.
...
Perfect!
Acked-by: Thomas Renninger <trenn@suse.de>

     Thomas
