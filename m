From: marxin.liska@gmail.com
Subject: ACPI ALS patch
Date: Thu, 29 Nov 2012 02:46:44 +0000
Message-ID: <1354157205-2956-1-git-send-email-marxin.liska@gmail.com>
References: <CAHR064j_7Y3wYXVXmC4TqZHxkqa0Z2HK84-OaDTiC7oesB_TrQ@mail.gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ea0-f174.google.com ([209.85.215.174]:59456 "EHLO
	mail-ea0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755310Ab2K2Cqt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 28 Nov 2012 21:46:49 -0500
In-Reply-To: <CAHR064j_7Y3wYXVXmC4TqZHxkqa0Z2HK84-OaDTiC7oesB_TrQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: corentin.chary@gmail.com
Cc: marex@denx.de, jic23@cam.ac.uk, platform-driver-x86@vger.kernel.org, linux-iio@vger.kernel.org, rui.zhang@intel.com, jlee@suse.com, len.brown@intel.com, pavel@denx.de, jbrenner@taosinc.com, pmeerw@pmeerw.net


Attached patch for ACPI ALS using iio subsystem handles all events in ACPI notify event handler. I would like to ask you how to modify iio trigger which is in fact not used and just initialized with buffer?
