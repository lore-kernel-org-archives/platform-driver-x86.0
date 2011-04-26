From: Peter Feuerer <peter@piie.net>
Subject: Re: [PATCH] acerhdf: Drop pointless dependency on THERMAL_HWMON
Date: Tue, 26 Apr 2011 16:11:53 +0200
Message-ID: <cone.1303827113.847510.4025.1000@deskpiie>
References: <20110424110008.439dd333@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtprelay06.ispgateway.de ([80.67.31.96]:58350 "EHLO
	smtprelay06.ispgateway.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755273Ab1DZORz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 26 Apr 2011 10:17:55 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, Guenter Roeck <guenter.roeck@ericsson.com>

Jean Delvare writes:

> The THERMAL_HWMON config option simply exposes the thermal zone
> temperature values and limits to user-space. It makes no sense for a
> kernel driver to depend on this.
> 
> Signed-off-by: Jean Delvare <khali@linux-fr.org>

Acked-by: Peter Feuerer <peter@piie.net>
