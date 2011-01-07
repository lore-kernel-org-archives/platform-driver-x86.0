From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] ACPI Thinkpad: We must always call va_end() after
	va_start() but do not do so in thinkpad_acpi.c::acpi_evalf()
Date: Fri, 7 Jan 2011 22:27:48 +0000
Message-ID: <20110107222748.GC32575@srcf.ucam.org>
References: <alpine.LNX.2.00.1012241952200.28973@swampdragon.chaosbits.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.00.1012241952200.28973@swampdragon.chaosbits.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jesper Juhl <jj@chaosbits.net>
Cc: ibm-acpi-devel@lists.sourceforge.net, Borislav Deianov <borislav@users.sf.net>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Applied, thanks.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
