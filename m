From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH 3/5] platform-x86: intel_mid_thermal: add msic_thermal
 alias
Date: Mon, 30 Jan 2012 10:59:05 +0000
Message-ID: <20120130105905.34e44578@pyramind.ukuu.org.uk>
References: <20120126173729.16719.15431.stgit@bob.linux.org.uk>
	<20120126173912.16719.51752.stgit@bob.linux.org.uk>
	<4D68720C2E767A4AA6A8796D42C8EB5902FDDD@BGSMSX101.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:46852 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751794Ab2A3K5o (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 30 Jan 2012 05:57:44 -0500
In-Reply-To: <4D68720C2E767A4AA6A8796D42C8EB5902FDDD@BGSMSX101.gar.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "R, Durgadoss" <durgadoss.r@intel.com>
Cc: "mjg@redhat.com" <mjg@redhat.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

> In all the medfield boards, that we use here, this is named 'msic_thermal'.
> So, maybe we should remove msic_sensor and just use msic_thermal.
> Or, Do you have any medfield boards that have this entry as 'msic_sensor' ?

I will check if we do.

Alan
